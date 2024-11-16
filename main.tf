module "controller_build" {
  count  = var.module_config.controller_deployment ? 1 : 0
  source = "./modules/controller_build"

  // please do not use special characters such as `\/"[]:|<>+=;,?*@&~!#$%^()_{}'` in the controller_name
  controller_name      = var.controller_name
  incoming_ssl_cidrs   = local.controller_allowed_cidrs
  use_existing_network = var.use_existing_network
  access_account_name  = "GCP"
}


module "controller_init" {
  count = var.module_config.controller_initialization ? 1 : 0

  source  = "terraform-aviatrix-modules/controller-init/aviatrix"
  version = "v1.0.2"

  controller_public_ip      = module.controller_build[0].controller_public_ip_address
  controller_private_ip     = module.controller_build[0].controller_private_ip_address
  controller_admin_email    = var.controller_admin_email
  controller_admin_password = var.controller_admin_password
  customer_id               = var.customer_id

  depends_on = [
    module.controller_build
  ]
}

#Copilot
module "copilot_build" {
  count = var.module_config.copilot_deployment ? 1 : 0

  source = "./modules/copilot_build"

  use_existing_network   = true
  network                = module.controller_build[0].network.self_link
  subnetwork             = module.controller_build[0].subnetwork.self_link
  controller_public_ip   = module.controller_build[0].controller_public_ip_address
  controller_private_ip  = module.controller_build[0].controller_private_ip_address
  copilot_name           = var.copilot_name
  default_data_disk_size = "100"

  allowed_cidrs = {
    "tcp-443" = {
      protocol = "Tcp"
      port     = 443
      cidrs    = var.incoming_ssl_cidrs
    }
    "udp-5000" = {
      protocol = "Udp"
      port     = 5000
      cidrs    = [module.controller_build[0].controller_public_ip_address]
    }
    "udp-31283" = {
      protocol = "Udp"
      port     = 31283
      cidrs    = [module.controller_build[0].controller_public_ip_address]
    }
  }
}

module "copilot_init" {
  count = var.module_config.copilot_initialization ? 1 : 0

  source  = "terraform-aviatrix-modules/copilot-init/aviatrix"
  version = "v1.0.3"

  controller_public_ip             = module.controller_build[0].controller_public_ip_address
  controller_admin_password        = var.controller_admin_password
  copilot_public_ip                = module.copilot_build[0].public_ip
  service_account_email            = var.controller_admin_email
  copilot_service_account_password = var.controller_admin_password

  depends_on = [
    module.controller_init
  ]
}
