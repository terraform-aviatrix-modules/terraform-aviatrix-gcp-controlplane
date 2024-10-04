module "controller_build" {
  count  = var.module_config.controller_deployment ? 1 : 0
  source = "./modules/controller_build"


  // please do not use special characters such as `\/"[]:|<>+=;,?*@&~!#$%^()_{}'` in the controller_name
  controller_name      = "test"
  incoming_ssl_cidrs   = var.incoming_ssl_cidrs
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
