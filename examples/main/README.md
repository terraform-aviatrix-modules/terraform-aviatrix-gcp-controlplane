This is a deployment example for this module.

Execute the following Terraform code:

```hcl
provider "google" {
  project = "<project id>"
  region  = "us-east1"
  zone    = "us-east1-b"
}

module "control_plane" {
  source  = "terraform-aviatrix-modules/gcp-controlplane/aviatrix"
  version = "v1.0.0"

  controller_name           = "my_controller"
  incoming_ssl_cidrs        = ["1.2.3.4"]
  controller_admin_email    = "admin@domain.com"
  controller_admin_password = "mysecretpassword"
  account_email             = "admin@domain.com"
  customer_id               = "xxxxxxx-abu-xxxxxxxxx"
}

output "controlplane_data" {
  value = module.control_plane
}
```
