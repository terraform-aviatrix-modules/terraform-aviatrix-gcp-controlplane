variable "controller_name" {
  type        = string
  description = "The Aviatrix Controller name"
  default     = "aviatrix-controller"
  nullable    = false

  validation {
    condition     = can(regex("^[^\\\\/\"\\[\\]:|<>+=;,?*@&~!#$%^()_{}']*$", var.controller_name))
    error_message = "controller_name cannot contain special characters: \\ / \" [ ] : | < > + = ; , ? * @ & ~ ! # $ % ^ ( ) _ { } '"
  }
}

variable "controller_version" {
  type        = string
  description = "Aviatrix Controller version. Used to determine image generation (major < 10 = g4, >= 10 = g5). Use 'latest' for the newest generation."
  default     = "latest"
  nullable    = false
}

variable "controller_machine_type" {
  type        = string
  description = "The machine type to create the Aviatrix Controller"
  default     = "n2-standard-4"
  nullable    = false
}

variable "image" {
  type        = string
  description = "The image from which to initialize this disk. Overrides controller_version when set."
  default     = ""
  nullable    = false
}

variable "incoming_ssl_cidrs" {
  type        = list(string)
  description = "The CIDRs to be allowed for HTTPS(port 443) access to the Aviatrix Controller"
}

variable "use_existing_network" {
  type        = bool
  description = "Whether to use an existing network"
  default     = false
  nullable    = false
}

variable "network_name" {
  type        = string
  description = "Name of the network to be created or an existing network"
  default     = "aviatrix-controller-network"
  nullable    = false
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnetwork to be created or an existing subnetwork"
  default     = "aviatrix-controller-subnetwork"
  nullable    = false
}

variable "subnet_cidr" {
  type        = string
  description = "The CIDR for the subnetwork this module will create"
  default     = "10.128.0.0/9"
  nullable    = false
}

variable "region" {
  type        = string
  description = "The GCP region for the controller. If null, uses the Google provider's default."
  default     = null
}

variable "zone" {
  type        = string
  description = "The GCP zone for the controller. If null, uses the Google provider's default."
  default     = null
}

variable "service_account_email" {
  type        = string
  description = "The Service Account to assign to the Aviatrix Controller"
  default     = ""
  nullable    = false
}

variable "service_account_scopes" {
  type        = list(string)
  description = "The scopes to assign to the Aviatrix Controller's Service Account"
  default     = ["cloud-platform"]
  nullable    = false
}

variable "ip_address_name" {
  type        = string
  description = "Name of the compute address to be created"
  default     = "aviatrix-controller-address"
  nullable    = false
}

variable "firewall_name" {
  type        = string
  description = "Name of the firewall to be created"
  default     = "aviatrix-controller-firewall"
  nullable    = false
}

variable "network_tags" {
  type        = set(string)
  description = "Compute instance network tags"
  default     = ["controller"]
  nullable    = false
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to the controller instance"
  default     = {}
  nullable    = false
}

variable "name_prefix" {
  type        = string
  description = "Prefix to apply to resource names"
  default     = ""
  nullable    = false
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
