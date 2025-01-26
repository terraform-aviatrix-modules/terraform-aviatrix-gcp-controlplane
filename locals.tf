locals {
  copilot_public_ip        = var.module_config.copilot_deployment ? module.copilot_build[0].public_ip : null
  controller_allowed_cidrs = var.module_config.copilot_deployment ? concat(var.incoming_ssl_cidrs, [local.copilot_public_ip]) : var.incoming_ssl_cidrs
}
