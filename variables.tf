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
  default     = "Aviatrix-Controller"
}

variable "access_account_name" {
  type        = string
  description = "aviatrix controller access account name"
}

variable "account_email" {
  type        = string
  description = "aviatrix controller access account email"
}

variable "incoming_ssl_cidrs" {
  type        = list(string)
  description = "Incoming cidr for security group used by controller"
}

variable "use_existing_network" {
  default = false
}

variable "module_config" {
  default = {
    controller_deployment     = true,
    controller_initialization = true,
    copilot_deployment        = true,
    copilot_initialization    = true,
    account_onboarding        = true,
  }
}
