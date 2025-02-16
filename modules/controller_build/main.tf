resource "google_compute_network" "controller_network" {
  count                   = var.use_existing_network ? 0 : 1
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "controller_subnet" {
  count         = var.use_existing_network ? 0 : 1
  name          = var.subnet_name
  network       = google_compute_network.controller_network[0].self_link
  ip_cidr_range = var.subnet_cidr
  region = var.region
}

resource "google_compute_address" "ip_address" {
  name         = var.ip_address_name
  address_type = "EXTERNAL"
}


data "google_compute_network" "controller_network" {
  count = var.use_existing_network ? 1 : 0
  name  = var.network_name
}

data "google_compute_subnetwork" "controller_subnet" {
  count = var.use_existing_network ? 1 : 0
  name  = var.subnet_name
}

resource "google_compute_instance" "controller" {
  name         = var.controller_name
  machine_type = var.controller_machine_type
  zone         = var.zone
  tags         = var.network_tags

  boot_disk {
    initialize_params {
      image = var.image == "" ? jsondecode(data.http.image_info.response_body)["g3"]["amd64"]["gcp"] : var.image
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
}

resource "google_compute_firewall" "controller_firewall" {
  name          = var.firewall_name
  network       = var.use_existing_network ? data.google_compute_network.controller_network[0].self_link : google_compute_network.controller_network[0].self_link
  target_tags   = google_compute_instance.controller.tags
  source_ranges = var.incoming_ssl_cidrs

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

data "http" "image_info" {
  url = "https://cdn.prod.sre.aviatrix.com/image-details/gcp_controller_image_details.json"

  request_headers = {
    "Accept" = "application/json"
  }
}
