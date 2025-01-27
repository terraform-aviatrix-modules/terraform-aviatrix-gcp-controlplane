<!-- BEGIN_TF_DOCS -->
# terraform-aviatrix-gcp-controlplane

### Description
This module deploys the Aviatrix control plane, or individual parts thereof.

### Compatibility
Module version | Terraform version
:--- | :---
v1.0.0 | >= 1.3.0 |

### Usage Example
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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_controller_admin_email"></a> [controller\_admin\_email](#input\_controller\_admin\_email) | aviatrix controller admin email address | `string` | n/a | yes |
| <a name="input_controller_admin_password"></a> [controller\_admin\_password](#input\_controller\_admin\_password) | aviatrix controller admin password | `string` | n/a | yes |
| <a name="input_controller_name"></a> [controller\_name](#input\_controller\_name) | Customized Name for Aviatrix Controller | `string` | `"aviatrix-controller"` | no |
| <a name="input_controller_version"></a> [controller\_version](#input\_controller\_version) | Aviatrix Controller version | `string` | `"latest"` | no |
| <a name="input_copilot_name"></a> [copilot\_name](#input\_copilot\_name) | Customized Name for Aviatrix Copilot | `string` | `"aviatrix-copilot"` | no |
| <a name="input_customer_id"></a> [customer\_id](#input\_customer\_id) | aviatrix customer license id | `string` | n/a | yes |
| <a name="input_incoming_ssl_cidrs"></a> [incoming\_ssl\_cidrs](#input\_incoming\_ssl\_cidrs) | Incoming cidr for security group used by controller | `list(string)` | n/a | yes |
| <a name="input_module_config"></a> [module\_config](#input\_module\_config) | n/a | `map` | <pre>{<br/>  "controller_deployment": true,<br/>  "controller_initialization": true,<br/>  "copilot_deployment": true,<br/>  "copilot_initialization": true<br/>}</pre> | no |
| <a name="input_use_existing_network"></a> [use\_existing\_network](#input\_use\_existing\_network) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_controller_private_ip"></a> [controller\_private\_ip](#output\_controller\_private\_ip) | n/a |
| <a name="output_controller_public_ip"></a> [controller\_public\_ip](#output\_controller\_public\_ip) | n/a |
| <a name="output_copilot_private_ip"></a> [copilot\_private\_ip](#output\_copilot\_private\_ip) | n/a |
| <a name="output_copilot_public_ip"></a> [copilot\_public\_ip](#output\_copilot\_public\_ip) | n/a |
<!-- END_TF_DOCS -->