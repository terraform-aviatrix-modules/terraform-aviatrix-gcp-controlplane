variable "customer_id" {
  type        = string
  description = "aviatrix customer license id"
}

variable "controller_admin_email" {
  type        = string
  description = "aviatrix controller admin email address"
}

variable "controller_admin_password" {
  type        = string
  description = "aviatrix controller admin password"
}

variable "controller_name" {
  type        = string
  description = "Customized Name for Aviatrix Controller"
  default     = "aviatrix-controller"
}

variable "controller_version" {
  type        = string
  description = "Aviatrix Controller version"
  default     = "latest"
}

# terraform-doc-ignore
variable "controller_image" {
  type        = string
  description = "Aviatrix Controller Image"
  default     = ""
}

variable "incoming_ssl_cidrs" {
  type        = list(string)
  description = "Incoming cidr for security group used by controller"
}

variable "use_existing_network" {
  default = false
}

variable "copilot_name" {
  type        = string
  description = "Customized Name for Aviatrix Copilot"
  default     = "aviatrix-copilot"
}

variable "module_config" {
  default = {
    controller_deployment     = true,
    controller_initialization = true,
    copilot_deployment        = true,
    copilot_initialization    = true,
  }
}

# terraform-docs-ignore
variable "environment" {
  description = "Determines the deployment environment. For internal use only."
  type        = string
  default     = "prod"
  nullable    = false

  validation {
    condition     = contains(["prod", "staging"], var.environment)
    error_message = "The environment must be either 'prod' or 'staging'."
  }
}

# terraform-docs-ignore
variable "registry_auth_token" {
  description = "The token used to authenticate to the controller artifact registry. For internal use only."
  type        = string
  default     = ""
  nullable    = false
}
