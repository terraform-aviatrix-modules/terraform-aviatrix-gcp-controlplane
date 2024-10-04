output "controller_public_ip_address" {
  value = google_compute_instance.controller.network_interface[0].access_config[0].nat_ip
}

output "controller_private_ip_address" {
  value = google_compute_instance.controller.network_interface[0].network_ip
}
