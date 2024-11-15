# terraform-aviatrix-gcp-controlplane

### Description
This module deploys the Aviatrix control plane, or individual parts thereof.


### Compatibility
Module version | Terraform version
:--- | :---
v1.0.0 | >= 1.3.0 |

### Usage Example
```hcl
module "controlplane" {

  source  = "terraform-aviatrix-modules/gcp-controlplane/aviatrix"
  version = "1.0.0"

  controller_name           = "ctrl"
  copilot_name              = "cplt"
  incoming_ssl_cidrs        = ["1.2.3.4"]
  controller_admin_email    = "admin@domain.com"
  controller_admin_password = "mysecretpassword"
  customer_id               = "xxxxxxx-abu-xxxxxxxxx"
}

output "test-gcp" {
  value = module.controlplane
}
```

### Variables
The following variables are required:

key | value
:--- | :---
\<keyname> | \<description of value that should be provided in this variable>

The following variables are optional:

key | default | value 
:---|:---|:---
\<keyname> | \<default value> | \<description of value that should be provided in this variable>

### Outputs
This module will return the following outputs:

key | description
:---|:---
\<keyname> | \<description of object that will be returned in this output>
