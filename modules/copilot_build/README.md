<!-- BEGIN_TF_DOCS -->
# terraform-aviatrix-gcp-controlplane - copilot-build

### Description
This submodule creates the Copilot virtual machine and related components.

### Usage Example
```hcl
module "copilot_build" {
  source = "./modules/copilot_build"

  subnet_cidr            = "10.0.0.0/24"
  controller_public_ip   = "123.2.3.4"
  controller_private_ip  = "10.2.3.4"
  copilot_name           = "my_copilot"
  default_data_disk_size = "100"

  allowed_cidrs = {
    "tcp_cidrs" = {
      priority = "100"
      protocol = "Tcp"
      ports    = ["443"]
      cidrs    = ["1.2.3.4/32"]
    }
    "udp_cidrs" = {
      priority = "200"
      protocol = "Udp"
      ports    = ["5000", "31283"]
      cidrs    = ["123.2.3.4"]
    }
  }
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_disks"></a> [additional\_disks](#input\_additional\_disks) | A set of additional disks' `name` or `self_link` that will be attached to the copilot instance | `set(string)` | `[]` | no |
| <a name="input_allowed_cidrs"></a> [allowed\_cidrs](#input\_allowed\_cidrs) | n/a | <pre>map(object({<br/>    protocol = string,<br/>    port     = number<br/>    cidrs    = set(string),<br/>  }))</pre> | n/a | yes |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Boot disk size for copilot | `number` | `30` | no |
| <a name="input_controller_private_ip"></a> [controller\_private\_ip](#input\_controller\_private\_ip) | Controller private IP | `string` | n/a | yes |
| <a name="input_controller_public_ip"></a> [controller\_public\_ip](#input\_controller\_public\_ip) | Controller public IP | `string` | `"0.0.0.0"` | no |
| <a name="input_copilot_machine_type"></a> [copilot\_machine\_type](#input\_copilot\_machine\_type) | The machine type to create the Aviatrix Copilot | `string` | `"e2-standard-2"` | no |
| <a name="input_copilot_name"></a> [copilot\_name](#input\_copilot\_name) | The Aviatrix Copilot name | `string` | `"aviatrix-copilot"` | no |
| <a name="input_default_data_disk_name"></a> [default\_data\_disk\_name](#input\_default\_data\_disk\_name) | Name of default data disk. If default data disk is not created, this variable will be ignored. | `string` | `"default-data-disk"` | no |
| <a name="input_default_data_disk_size"></a> [default\_data\_disk\_size](#input\_default\_data\_disk\_size) | Size of default data disk. If not set, no default data disk will be created. | `number` | `0` | no |
| <a name="input_image"></a> [image](#input\_image) | Image name | `string` | `""` | no |
| <a name="input_ip_address_name"></a> [ip\_address\_name](#input\_ip\_address\_name) | IP address name | `string` | `"aviatrix-copilot-address"` | no |
| <a name="input_is_cluster"></a> [is\_cluster](#input\_is\_cluster) | Flag to indicate whether the copilot is for a cluster | `bool` | `false` | no |
| <a name="input_network"></a> [network](#input\_network) | The network to attach to the Aviatrix Copilot | `string` | `""` | no |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | Compute instance network tags | `set(string)` | <pre>[<br/>  "copilot"<br/>]</pre> | no |
| <a name="input_private_mode"></a> [private\_mode](#input\_private\_mode) | Flag to indicate whether the copilot is for private mode | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The Service Account to assign to the Aviatrix Copilot | `string` | `""` | no |
| <a name="input_service_account_scopes"></a> [service\_account\_scopes](#input\_service\_account\_scopes) | The scopes to assign to the Aviatrix Copilot's Service Account | `set(string)` | <pre>[<br/>  "cloud-platform"<br/>]</pre> | no |
| <a name="input_ssh_public_key_file_content"></a> [ssh\_public\_key\_file\_content](#input\_ssh\_public\_key\_file\_content) | File content of the SSH public key | `string` | `""` | no |
| <a name="input_ssh_public_key_file_path"></a> [ssh\_public\_key\_file\_path](#input\_ssh\_public\_key\_file\_path) | File path to the SSH public key | `string` | `""` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | SSH user name | `string` | `""` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The cidr for the subnetwork this module will create or an existing subnet | `string` | `"10.128.0.0/9"` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to attach the Aviatrix Copilot | `string` | `""` | no |
| <a name="input_use_existing_network"></a> [use\_existing\_network](#input\_use\_existing\_network) | Flag to indicate whether to use an existing network | `bool` | `false` | no |
| <a name="input_use_existing_ssh_key"></a> [use\_existing\_ssh\_key](#input\_use\_existing\_ssh\_key) | Flag to indicate whether to use an existing ssh key | `bool` | `false` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_network"></a> [network](#output\_network) | n/a |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
<!-- END_TF_DOCS -->