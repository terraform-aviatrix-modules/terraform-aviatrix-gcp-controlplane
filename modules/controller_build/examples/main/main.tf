module "controller_build" {
  source = "../../"

  controller_name    = "my-controller"
  incoming_ssl_cidrs = ["1.2.3.4/32"]
  region             = "us-east1"
  zone               = "us-east1-b"

  # Optional
  # controller_version      = "latest"
  # controller_machine_type = "n2-standard-4"
  # labels                  = { environment = "dev" }
}
