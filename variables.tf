variable "customer_id" {
  type        = string
  description = "Aviatrix customer license ID"
}

variable "controller_admin_email" {
  type        = string
  description = "Aviatrix controller admin email address"
}

variable "controller_admin_password" {
  type        = string
  description = "Aviatrix controller admin password"
  sensitive   = true
}

variable "controller_name" {
  type        = string
  description = "Customized Name for Aviatrix Controller. If null, the submodule default is used."
  default     = null
}

variable "controller_version" {
  type        = string
  description = "Aviatrix Controller version. Determines image generation (major < 10 = g4, >= 10 = g5). Use 'latest' for the newest generation."
  default     = "latest"
}

variable "controller_machine_type" {
  type        = string
  description = "The machine type for the Aviatrix Controller. If null, the submodule default (n2-standard-4) is used."
  default     = null
}

variable "incoming_ssl_cidrs" {
  type        = list(string)
  description = "Incoming CIDRs for security group used by controller"
}

variable "use_existing_network" {
  default = false
}

variable "network_name" {
  type        = string
  description = "The name of the network (VPC) where Aviatrix Controller and CoPilot will be deployed. If null, the submodule default is used."
  default     = null
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnetwork where Aviatrix Controller and CoPilot will be deployed. If null, the submodule default is used."
  default     = null
}

variable "subnet_cidr" {
  type        = string
  description = "The CIDR for the subnetwork. If null, the submodule default is used."
  default     = null
}

variable "region" {
  type        = string
  description = "The region where Aviatrix Controller and CoPilot will be deployed. If null, derived from the Google provider configuration."
  default     = null
}

variable "zone" {
  type        = string
  description = "The zone where Aviatrix Controller and CoPilot will be deployed. If null, derived from the Google provider configuration."
  default     = null
}

variable "service_account_email" {
  type        = string
  description = "The Service Account email for the Aviatrix Controller and CoPilot. If null, the submodule default is used."
  default     = null
}

variable "copilot_name" {
  type        = string
  description = "Customized Name for Aviatrix Copilot. If null, the submodule default is used."
  default     = null
}

variable "copilot_machine_type" {
  type        = string
  description = "Machine type for Aviatrix CoPilot. Use e2-standard-4 or a larger supported machine type."
  default     = null
}

variable "copilot_data_disk_size" {
  type        = number
  description = "The size of the CoPilot data disk in GB. Use 1000 for production. If null, the submodule default is used."
  default     = null
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to all resources"
  default     = {}
}

variable "name_prefix" {
  type        = string
  description = "Prefix to apply to all resource names"
  default     = ""
}

variable "image" {
  type        = string
  description = "Custom image override for the controller. Takes precedence over controller_version."
  default     = null
}

variable "module_config" {
  default = {
    controller_deployment     = true,
    controller_initialization = true,
    copilot_deployment        = true,
    copilot_initialization    = true,
  }
}
