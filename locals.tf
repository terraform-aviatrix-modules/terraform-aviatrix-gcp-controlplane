locals {
  copilot_public_ip        = var.module_config.copilot_deployment ? [format("%s/32", module.copilot_build[0].public_ip)] : []
  copilot_private_ip       = var.module_config.copilot_deployment ? [format("%s/32", module.copilot_build[0].private_ip)] : []
  copilot_ips              = concat(local.copilot_private_ip, local.copilot_public_ip)
  controller_allowed_cidrs = contains(var.incoming_ssl_cidrs, "0.0.0.0/0") ? ["0.0.0.0/0"] : concat(var.incoming_ssl_cidrs, local.copilot_ips)
}
