provider "google" {
  project = "<project id>"
  region  = "us-east1"
  zone    = "us-east1-b"
}

module "control_plane" {
  source  = "terraform-aviatrix-modules/gcp-controlplane/aviatrix"
  version = "v1.1.0"

  # Required
  customer_id               = "xxxxxxx-abu-xxxxxxxxx"
  controller_admin_email    = "admin@domain.com"
  controller_admin_password = "mysecretpassword"
  incoming_ssl_cidrs        = ["1.2.3.4/32"]
  region                    = "us-east1"
  zone                      = "us-east1-b"

  # Optional — all have sensible defaults
  # controller_name         = "my-controller"
  # controller_version      = "latest"       # or e.g. "7.2" for g4, "10.0" for g5
  # controller_machine_type = "n2-standard-4"
  # service_account_email   = "my-sa@project.iam.gserviceaccount.com"
  # labels                  = { environment = "prod" }
}

output "controlplane_data" {
  value = module.control_plane
}
