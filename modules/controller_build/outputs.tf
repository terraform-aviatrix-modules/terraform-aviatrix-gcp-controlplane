output "controller_public_ip_address" {
  value = google_compute_instance.controller.network_interface[0].access_config[0].nat_ip
}

output "controller_private_ip_address" {
  value = google_compute_instance.controller.network_interface[0].network_ip
}

output "network" {
  value = var.use_existing_network ? data.google_compute_network.controller_network[0].self_link : google_compute_network.controller_network[0].self_link
}

output "subnetwork" {
  value = var.use_existing_network ? data.google_compute_subnetwork.controller_subnet[0].self_link : google_compute_subnetwork.controller_subnet[0].self_link
}