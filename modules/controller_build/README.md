<!-- BEGIN_TF_DOCS -->
# terraform-aviatrix-gcp-controlplane - controller-build

### Description
This submodule creates the controller virtual machine and related components.

### Usage Example
```hcl
module "controller_build" {
  source = "./modules/controller_build"
  // please do not use special characters such as `\/"[]:|<>+=;,?*@&~!#$%^()_{}'` in the controller_name
  controller_name    = "my_controller"
  incoming_ssl_cidrs = ["1.2.3.4/32"]
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_account_name"></a> [access\_account\_name](#input\_access\_account\_name) | Name of the access account to create on the Aviatrix Controller | `string` | n/a | yes |
| <a name="input_controller_machine_type"></a> [controller\_machine\_type](#input\_controller\_machine\_type) | The machine type to create the Aviatrix Controller | `string` | `"e2-standard-2"` | no |
| <a name="input_controller_name"></a> [controller\_name](#input\_controller\_name) | The Aviatrix Controller name | `string` | `"aviatrix-controller"` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | Name of the firewall to be created | `string` | `"aviatrix-controller-firewall"` | no |
| <a name="input_image"></a> [image](#input\_image) | The image from which to initialize this disk | `string` | `""` | no |
| <a name="input_incoming_ssl_cidrs"></a> [incoming\_ssl\_cidrs](#input\_incoming\_ssl\_cidrs) | The CIDRs to be allowed for HTTPS(port 443) access to the Aviatrix Controller | `list(string)` | n/a | yes |
| <a name="input_ip_address_name"></a> [ip\_address\_name](#input\_ip\_address\_name) | Name of the compute address to be created | `string` | `"aviatrix-controller-address"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the network to be created or an existing network | `string` | `"aviatrix-controller-network"` | no |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | Compute instance network tags | `set(string)` | <pre>[<br/>  "controller"<br/>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The Service Account to assign to the Aviatrix Controller | `string` | `""` | no |
| <a name="input_service_account_scopes"></a> [service\_account\_scopes](#input\_service\_account\_scopes) | The scopes to assign to the Aviatrix Controller's Service Account | `list(string)` | <pre>[<br/>  "cloud-platform"<br/>]</pre> | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The CIDR for the subnetwork this module will create | `string` | `"10.128.0.0/9"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnetwork to be created or an existing subnetwork | `string` | `"aviatrix-controller-subnetwork"` | no |
| <a name="input_use_existing_network"></a> [use\_existing\_network](#input\_use\_existing\_network) | Whether to use an existing network | `bool` | `false` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_controller_private_ip_address"></a> [controller\_private\_ip\_address](#output\_controller\_private\_ip\_address) | n/a |
| <a name="output_controller_public_ip_address"></a> [controller\_public\_ip\_address](#output\_controller\_public\_ip\_address) | n/a |
| <a name="output_network"></a> [network](#output\_network) | n/a |
| <a name="output_subnetwork"></a> [subnetwork](#output\_subnetwork) | n/a |
<!-- END_TF_DOCS -->