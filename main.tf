module "controller_build" {
  count  = var.module_config.controller_deployment ? 1 : 0
  source = "./modules/controller_build"

  controller_name         = var.controller_name
  controller_version      = var.controller_version
  controller_machine_type = var.controller_machine_type
  image                   = var.image
  incoming_ssl_cidrs      = local.controller_allowed_cidrs
  use_existing_network    = var.use_existing_network
  network_name            = var.network_name
  subnet_name             = var.subnet_name
  subnet_cidr             = var.subnet_cidr
  region                  = var.region
  zone                    = var.zone
  service_account_email   = var.service_account_email
  labels                  = var.labels
  name_prefix             = var.name_prefix
}

module "controller_init" {
  count = var.module_config.controller_initialization ? 1 : 0

  source  = "terraform-aviatrix-modules/controller-init/aviatrix"
  version = "v1.0.4"

  controller_public_ip      = module.controller_build[0].controller_public_ip_address
  controller_private_ip     = module.controller_build[0].controller_private_ip_address
  controller_admin_email    = var.controller_admin_email
  controller_admin_password = var.controller_admin_password
  customer_id               = var.customer_id
  controller_version        = var.controller_version
  wait_for_setup_duration   = "0s"

  depends_on = [
    module.controller_build
  ]
}

# Copilot
module "copilot_build" {
  count = var.module_config.copilot_deployment ? 1 : 0

  source = "./modules/copilot_build"

  use_existing_network   = true
  network                = module.controller_build[0].network
  subnetwork             = module.controller_build[0].subnetwork
  controller_public_ip   = module.controller_build[0].controller_public_ip_address
  controller_private_ip  = module.controller_build[0].controller_private_ip_address
  copilot_name           = var.copilot_name
  region                 = var.region
  zone                   = var.zone
  default_data_disk_size = var.copilot_data_disk_size

  allowed_cidrs = {
    "tcp-443" = {
      protocol = "Tcp"
      ports    = ["443"]
      cidrs    = var.incoming_ssl_cidrs
    }
    "udp-5000" = {
      protocol = "Udp"
      ports    = ["5000"]
      cidrs    = [format("%s/32", module.controller_build[0].controller_public_ip_address)]
    }
    "udp-31283" = {
      protocol = "Udp"
      ports    = ["31283"]
      cidrs    = [format("%s/32", module.controller_build[0].controller_public_ip_address)]
    }
    "tcp-50441-50443" = {
      protocol = "Tcp"
      ports    = ["50441-50443"]
      cidrs = [
        format("%s/32", module.controller_build[0].controller_public_ip_address),
        format("%s/32", module.controller_build[0].controller_private_ip_address),
      ]
    }
  }
}

module "copilot_init" {
  count = var.module_config.copilot_initialization ? 1 : 0

  source  = "terraform-aviatrix-modules/copilot-init/aviatrix"
  version = "v1.0.6"

  controller_public_ip             = module.controller_build[0].controller_public_ip_address
  controller_admin_password        = var.controller_admin_password
  copilot_public_ip                = module.copilot_build[0].public_ip
  service_account_email            = var.controller_admin_email
  copilot_service_account_password = var.controller_admin_password

  depends_on = [
    module.controller_init
  ]
}
