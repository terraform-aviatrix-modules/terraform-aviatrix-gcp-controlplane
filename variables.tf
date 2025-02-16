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
}

variable "module_config" {
  default = {
    controller_deployment     = true,
    controller_initialization = true,
    copilot_deployment        = true,
    copilot_initialization    = true,
  }
}

variable "network_name" {
  type = string
  description = "The name of the network (VPC) where Aviatrix Controller and CoPilot will be deployed"
}
variable "subnet_name" {
  type = string
  description = "The name of the subnetwork where Aviatrix Controller and CoPilot will be deployed"
}
variable "region" {
  type = string 
  description = "The region where Aviatrix Controller and CoPilot will be deployed"
}
variable "zone" {
  type = string
  description = "The zone where Aviatrix Controller and CoPilot will be deployed"
}
variable "copilot_data_disk_size" {
  type = string 
  description = "The size of the CoPilot data disk"
}
variable "service_account_email" {
  type = string 
  description = "The name of the Service Account associated with the project where Aviatrix Controller and CoPilot will be deployed"
}