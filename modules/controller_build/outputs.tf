output "controller_public_ip_address" {
  value       = google_compute_instance.controller.network_interface[0].access_config[0].nat_ip
  description = "Public IP address of the controller"
}

output "controller_private_ip_address" {
  value       = google_compute_instance.controller.network_interface[0].network_ip
  description = "Private IP address of the controller"
}

output "network" {
  value       = var.use_existing_network ? data.google_compute_network.controller_network[0].self_link : google_compute_network.controller_network[0].self_link
  description = "Self link of the controller network"
}

output "subnetwork" {
  value       = var.use_existing_network ? data.google_compute_subnetwork.controller_subnet[0].self_link : google_compute_subnetwork.controller_subnet[0].self_link
  description = "Self link of the controller subnetwork"
}

output "instance_id" {
  value       = google_compute_instance.controller.instance_id
  description = "Instance ID of the controller"
}

output "controller_name" {
  value       = local.controller_name
  description = "Name of the controller instance"
}

output "firewall_self_link" {
  value       = google_compute_firewall.controller_firewall.self_link
  description = "Self link of the controller firewall rule"
}

output "image_family" {
  value       = local.image_family
  description = "Image family (g4/g5) used by the controller"
}

output "service_account_email" {
  value       = google_compute_instance.controller.service_account[0].email
  description = "Service account email used by the controller"
}
