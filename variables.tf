################################################################################
### MODULE
################################################################################

variable "name" {
  description = "(Required) Name to be used on all the resources provisioned by this module as identifier"
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to add to all resources deployed by this module"
  type        = map(string)
  default     = {}
}

################################################################################
### TRANSIT GATEWAY ATTACHMENT (TGW)
################################################################################

variable "subnet_ids" {
  description = "(Required) List of Subnet IDs for Transit Gateway VPC Attachment"
  type        = list(string)
}

variable "transit_gateway_id" {
  description = "(Required) Transit Gateway ID for Transit Gateway VPC Attachment"
  type        = string
}

variable "vpc_id" {
  description = "(Required) VPC ID for Transit Gateway VPC Attachment."
  type        = string
}

variable "enable_appliance_mode_support" {
  description = "(Optional) If enabled, traffic flow between a source and destination uses the same Availability Zone for the VPC attachment for the lifetime of that flow."
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "(Optional) Should be true to enable DNS support."
  type        = bool
  default     = true
}

variable "enable_ipv6_support" {
  description = "(Optional) Should be true to enable IPv6 support."
  type        = bool
  default     = false
}

variable "tgw_default_route_table_association" {
  description = "(Optional) If enabled, determines whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table" 
  type        = bool
  default     = true 
}

variable "tgw_default_route_table_propagation" {
  description = "(Optional) If enabled, determines whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table" 
  type        = bool
  default     = true 
}

###############################################################################
### ROUTE TABLE (RTB)
###############################################################################

variable "route_table_ids" {
  description = "(Required) List of Route Table ID where a Transit Gateway Route needs to be added"
  type        = list(string)
}

variable "transit_gateway_route_cidrs" {
  description = "(Required) List of Transit Gateway Routes that need to be added"
  type        = list(string)
}
