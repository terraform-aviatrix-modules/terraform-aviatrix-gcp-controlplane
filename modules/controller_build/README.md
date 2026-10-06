<!-- BEGIN_TF_DOCS -->
# terraform-aviatrix-gcp-controlplane - controller-build

### Description
This submodule creates the controller virtual machine and related components.

### Usage Example
```hcl
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
```
## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_controller_machine_type"></a> [controller\_machine\_type](#input\_controller\_machine\_type) | The machine type to create the Aviatrix Controller | `string` | `"n2-standard-4"` | no |
| <a name="input_controller_name"></a> [controller\_name](#input\_controller\_name) | The Aviatrix Controller name | `string` | `"aviatrix-controller"` | no |
| <a name="input_controller_version"></a> [controller\_version](#input\_controller\_version) | Aviatrix Controller version. Used to determine image generation (major < 10 = g4, >= 10 = g5). Use 'latest' for the newest generation. | `string` | `"latest"` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | Name of the firewall to be created | `string` | `"aviatrix-controller-firewall"` | no |
| <a name="input_image"></a> [image](#input\_image) | The image from which to initialize this disk. Overrides controller\_version when set. | `string` | `""` | no |
| <a name="input_incoming_ssl_cidrs"></a> [incoming\_ssl\_cidrs](#input\_incoming\_ssl\_cidrs) | The CIDRs to be allowed for HTTPS(port 443) access to the Aviatrix Controller | `list(string)` | n/a | yes |
| <a name="input_ip_address_name"></a> [ip\_address\_name](#input\_ip\_address\_name) | Name of the compute address to be created | `string` | `"aviatrix-controller-address"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the controller instance | `map(string)` | `{}` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix to apply to resource names | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the network to be created or an existing network | `string` | `"aviatrix-controller-network"` | no |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | Compute instance network tags | `set(string)` | <pre>[<br/>  "controller"<br/>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The GCP region for the controller. If null, uses the Google provider's default. | `string` | `null` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The Service Account to assign to the Aviatrix Controller | `string` | `""` | no |
| <a name="input_service_account_scopes"></a> [service\_account\_scopes](#input\_service\_account\_scopes) | The scopes to assign to the Aviatrix Controller's Service Account | `list(string)` | <pre>[<br/>  "cloud-platform"<br/>]</pre> | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The CIDR for the subnetwork this module will create | `string` | `"10.128.0.0/9"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnetwork to be created or an existing subnetwork | `string` | `"aviatrix-controller-subnetwork"` | no |
| <a name="input_use_existing_network"></a> [use\_existing\_network](#input\_use\_existing\_network) | Whether to use an existing network | `bool` | `false` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The GCP zone for the controller. If null, uses the Google provider's default. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_controller_name"></a> [controller\_name](#output\_controller\_name) | Name of the controller instance |
| <a name="output_controller_private_ip_address"></a> [controller\_private\_ip\_address](#output\_controller\_private\_ip\_address) | Private IP address of the controller |
| <a name="output_controller_public_ip_address"></a> [controller\_public\_ip\_address](#output\_controller\_public\_ip\_address) | Public IP address of the controller |
| <a name="output_firewall_self_link"></a> [firewall\_self\_link](#output\_firewall\_self\_link) | Self link of the controller firewall rule |
| <a name="output_image_family"></a> [image\_family](#output\_image\_family) | Image family (g4/g5) used by the controller |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | Instance ID of the controller |
| <a name="output_network"></a> [network](#output\_network) | Self link of the controller network |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | Service account email used by the controller |
| <a name="output_subnetwork"></a> [subnetwork](#output\_subnetwork) | Self link of the controller subnetwork |
<!-- END_TF_DOCS -->