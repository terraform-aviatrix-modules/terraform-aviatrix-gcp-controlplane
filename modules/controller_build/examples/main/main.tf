module "controller_build" {
  source = "./modules/controller_build"
  // please do not use special characters such as `\/"[]:|<>+=;,?*@&~!#$%^()_{}'` in the controller_name
  controller_name    = "my_controller"
  incoming_ssl_cidrs = ["1.2.3.4/32"]
}
