output "public_ip" {
  value       = google_compute_instance.copilot.network_interface[0].access_config[0].nat_ip
  description = "Public IP address of the copilot"
}

output "private_ip" {
  value       = google_compute_instance.copilot.network_interface[0].network_ip
  description = "Private IP address of the copilot"
}

output "instance_id" {
  value       = google_compute_instance.copilot.instance_id
  description = "Instance ID of the copilot"
}

output "copilot_name" {
  value       = google_compute_instance.copilot.name
  description = "Name of the copilot instance"
}

output "network" {
  value       = var.use_existing_network ? var.network : google_compute_network.copilot_network[0].self_link
  description = "Self link of the copilot network"
}
