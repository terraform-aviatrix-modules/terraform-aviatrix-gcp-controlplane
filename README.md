<!-- BEGIN_TF_DOCS -->
# terraform-aviatrix-gcp-controlplane

### Description
This module deploys the Aviatrix control plane, or individual parts thereof.

### Compatibility
Module version | Terraform version
:--- | :---
v1.1.0 | >= 1.3.0 |

### Usage Example
```hcl
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
```
## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_controller_admin_email"></a> [controller\_admin\_email](#input\_controller\_admin\_email) | Aviatrix controller admin email address | `string` | n/a | yes |
| <a name="input_controller_admin_password"></a> [controller\_admin\_password](#input\_controller\_admin\_password) | Aviatrix controller admin password | `string` | n/a | yes |
| <a name="input_controller_machine_type"></a> [controller\_machine\_type](#input\_controller\_machine\_type) | The machine type for the Aviatrix Controller. If null, the submodule default (n2-standard-4) is used. | `string` | `null` | no |
| <a name="input_controller_name"></a> [controller\_name](#input\_controller\_name) | Customized Name for Aviatrix Controller. If null, the submodule default is used. | `string` | `null` | no |
| <a name="input_controller_version"></a> [controller\_version](#input\_controller\_version) | Aviatrix Controller version. Determines image generation (major < 10 = g4, >= 10 = g5). Use 'latest' for the newest generation. | `string` | `"latest"` | no |
| <a name="input_copilot_data_disk_size"></a> [copilot\_data\_disk\_size](#input\_copilot\_data\_disk\_size) | The size of the CoPilot data disk in GB. Use 1000 for production. If null, the submodule default is used. | `number` | `null` | no |
| <a name="input_copilot_machine_type"></a> [copilot\_machine\_type](#input\_copilot\_machine\_type) | Machine type for Aviatrix CoPilot. Use e2-standard-4 or a larger supported machine type. | `string` | `null` | no |
| <a name="input_copilot_name"></a> [copilot\_name](#input\_copilot\_name) | Customized Name for Aviatrix Copilot. If null, the submodule default is used. | `string` | `null` | no |
| <a name="input_customer_id"></a> [customer\_id](#input\_customer\_id) | Aviatrix customer license ID | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | Custom image override for the controller. Takes precedence over controller\_version. | `string` | `null` | no |
| <a name="input_incoming_ssl_cidrs"></a> [incoming\_ssl\_cidrs](#input\_incoming\_ssl\_cidrs) | Incoming CIDRs for security group used by controller | `list(string)` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_module_config"></a> [module\_config](#input\_module\_config) | n/a | `map` | <pre>{<br/>  "controller_deployment": true,<br/>  "controller_initialization": true,<br/>  "copilot_deployment": true,<br/>  "copilot_initialization": true<br/>}</pre> | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix to apply to all resource names | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network (VPC) where Aviatrix Controller and CoPilot will be deployed. If null, the submodule default is used. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where Aviatrix Controller and CoPilot will be deployed. If null, derived from the Google provider configuration. | `string` | `null` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The Service Account email for the Aviatrix Controller and CoPilot. If null, the submodule default is used. | `string` | `null` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The CIDR for the subnetwork. If null, the submodule default is used. | `string` | `null` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnetwork where Aviatrix Controller and CoPilot will be deployed. If null, the submodule default is used. | `string` | `null` | no |
| <a name="input_use_existing_network"></a> [use\_existing\_network](#input\_use\_existing\_network) | n/a | `bool` | `false` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where Aviatrix Controller and CoPilot will be deployed. If null, derived from the Google provider configuration. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_controller_image_family"></a> [controller\_image\_family](#output\_controller\_image\_family) | Image family (g4/g5) used by the controller |
| <a name="output_controller_instance_id"></a> [controller\_instance\_id](#output\_controller\_instance\_id) | Controller instance ID |
| <a name="output_controller_name"></a> [controller\_name](#output\_controller\_name) | Controller instance name |
| <a name="output_controller_private_ip"></a> [controller\_private\_ip](#output\_controller\_private\_ip) | Controller private IP address |
| <a name="output_controller_public_ip"></a> [controller\_public\_ip](#output\_controller\_public\_ip) | Controller public IP address |
| <a name="output_controller_service_account_email"></a> [controller\_service\_account\_email](#output\_controller\_service\_account\_email) | Service account email used by the controller |
| <a name="output_copilot_instance_id"></a> [copilot\_instance\_id](#output\_copilot\_instance\_id) | Copilot instance ID |
| <a name="output_copilot_private_ip"></a> [copilot\_private\_ip](#output\_copilot\_private\_ip) | Copilot private IP address |
| <a name="output_copilot_public_ip"></a> [copilot\_public\_ip](#output\_copilot\_public\_ip) | Copilot public IP address |
| <a name="output_firewall_self_link"></a> [firewall\_self\_link](#output\_firewall\_self\_link) | Self link of the controller firewall rule |
| <a name="output_network"></a> [network](#output\_network) | Self link of the controller network |
| <a name="output_subnetwork"></a> [subnetwork](#output\_subnetwork) | Self link of the controller subnetwork |
<!-- END_TF_DOCS -->