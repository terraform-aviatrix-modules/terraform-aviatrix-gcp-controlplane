locals {
  name_prefix     = var.name_prefix != "" ? "${var.name_prefix}-" : ""
  controller_name = "${local.name_prefix}${var.controller_name}"

  # Image selection — mirror the AWS/Azure pattern:
  # Parse major version from controller_version (e.g. "7.1.4" → 7).
  # Non-numeric values like "latest" fall through to 999.
  # Major < 10 → g4, >= 10 → g5.
  controller_major = try(tonumber(split(".", var.controller_version)[0]), 999)
  image_family     = local.controller_major < 10 ? "g4" : "g5"
  cdn_image        = jsondecode(data.http.image_info.response_body)[local.image_family]["amd64"]["gcp"]
  resolved_image   = var.image != "" ? var.image : local.cdn_image
}

data "http" "image_info" {
  url = format(
    "https://cdn.%s.sre.aviatrix.com/image-details/gcp_controller_image_details.json",
    var.environment
  )

  request_headers = {
    Accept = "application/json"
  }

  request_timeout_ms = 60000
}

resource "google_compute_network" "controller_network" {
  count                   = var.use_existing_network ? 0 : 1
  name                    = "${local.name_prefix}${var.network_name}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "controller_subnet" {
  count         = var.use_existing_network ? 0 : 1
  name          = "${local.name_prefix}${var.subnet_name}"
  network       = google_compute_network.controller_network[0].self_link
  ip_cidr_range = var.subnet_cidr
  region        = var.region
}

data "google_compute_network" "controller_network" {
  count = var.use_existing_network ? 1 : 0
  name  = var.network_name
}

data "google_compute_subnetwork" "controller_subnet" {
  count  = var.use_existing_network ? 1 : 0
  name   = var.subnet_name
  region = var.region
}

resource "google_compute_address" "ip_address" {
  name         = "${local.name_prefix}${var.ip_address_name}"
  address_type = "EXTERNAL"
  region       = var.region
}

resource "google_compute_instance" "controller" {
  name         = local.controller_name
  machine_type = var.controller_machine_type
  zone         = var.zone
  tags         = var.network_tags
  labels       = var.labels

  boot_disk {
    initialize_params {
      image = local.resolved_image
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  network_interface {
    network    = var.use_existing_network ? data.google_compute_network.controller_network[0].self_link : google_compute_network.controller_network[0].self_link
    subnetwork = var.use_existing_network ? data.google_compute_subnetwork.controller_subnet[0].self_link : google_compute_subnetwork.controller_subnet[0].self_link

    access_config {
      nat_ip = google_compute_address.ip_address.address
    }
  }

  lifecycle {
    ignore_changes = [boot_disk[0].initialize_params[0].image]
  }
}

resource "google_compute_firewall" "controller_firewall" {
  name          = "${local.name_prefix}${var.firewall_name}"
  network       = var.use_existing_network ? data.google_compute_network.controller_network[0].self_link : google_compute_network.controller_network[0].self_link
  target_tags   = google_compute_instance.controller.tags
  source_ranges = var.incoming_ssl_cidrs

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}
