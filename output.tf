output "controller_public_ip" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].controller_public_ip_address : null
  description = "Controller public IP address"
}

output "controller_private_ip" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].controller_private_ip_address : null
  description = "Controller private IP address"
}

output "controller_instance_id" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].instance_id : null
  description = "Controller instance ID"
}

output "controller_name" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].controller_name : null
  description = "Controller instance name"
}

output "controller_image_family" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].image_family : null
  description = "Image family (g4/g5) used by the controller"
}

output "controller_service_account_email" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].service_account_email : null
  description = "Service account email used by the controller"
}

output "network" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].network : null
  description = "Self link of the controller network"
}

output "subnetwork" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].subnetwork : null
  description = "Self link of the controller subnetwork"
}

output "firewall_self_link" {
  value       = var.module_config.controller_deployment ? module.controller_build[0].firewall_self_link : null
  description = "Self link of the controller firewall rule"
}

output "copilot_public_ip" {
  value       = var.module_config.copilot_deployment ? module.copilot_build[0].public_ip : null
  description = "Copilot public IP address"
}

output "copilot_private_ip" {
  value       = var.module_config.copilot_deployment ? module.copilot_build[0].private_ip : null
  description = "Copilot private IP address"
}

output "copilot_instance_id" {
  value       = var.module_config.copilot_deployment ? module.copilot_build[0].instance_id : null
  description = "Copilot instance ID"
}
