# terraform-aviatrix-gcp-controlplane - release notes

## Release Version
v1.1.0

### Feature
- Selects the Controller image generation from `controller_version`: G4 for numeric major versions below 10, and G5 for version 10 or later. `latest` selects G5, and a custom `image` overrides the CDN image.
- Adds support for using an existing GCP network and subnet, plus configurable Controller and CoPilot sizing, resource names, labels, and name prefixes.
- Updates Controller initialization to receive `controller_version` and aligns CoPilot initialization with `copilot-init` v1.0.6.
- Updates CoPilot firewall rules to support multiple ports, uses `e2-standard-4` as the default machine type, and creates a 100 GB data disk by default.
- Adds outputs for Controller and CoPilot instance details, image family, service account, network, subnet, and firewall.

### Upgrade Information
- Update the module version to `v1.1.0` and review the Terraform plan before applying, especially changes to instance sizing and CoPilot disk configuration.
- Consumers of `modules/copilot_build` directly must change each `allowed_cidrs` entry from a singular `port` value to a `ports` collection. The default CoPilot data disk size is now 100 GB; set it to `0` to skip creating the disk.

### Compatibility
Module version | Terraform version
:--- | :---
v1.1.0 | >= 1.3.0
