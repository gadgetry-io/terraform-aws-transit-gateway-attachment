###############################################################################
### TRANSIT GATEWAY ATTACHMENT (TGW)
###############################################################################

# TRANSIT GATEWAY ATTACHMENT
resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  subnet_ids         = var.subnet_ids
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.vpc_id

  appliance_mode_support = var.enable_appliance_mode_support ? "enable" : "disable"
  dns_support            = var.enable_dns_support ? "enable" : "disable"
  ipv6_support           = var.enable_ipv6_support ? "enable" : "disable"

  transit_gateway_default_route_table_association = var.tgw_default_route_table_association
  transit_gateway_default_route_table_propagation = var.tgw_default_route_table_propagation

  tags = var.tags
}

#######################################
# OUTPUTS
#######################################

output "tgw_attachment_id" {
  description = "The ID of the Transit Gateway Attachement"
  value       = [aws_ec2_transit_gateway_vpc_attachment.main.id]
}

output "tgw_id" {
  description = "The ID of the Transit Gateway configured in the Transit Gateway Attachment"
  value       = [aws_ec2_transit_gateway_vpc_attachment.main.vpc_id]
}

output "vpc_id" {
  description = "The ID of the VPC configured in the Transit Gateway Attachment VPC"
  value       = [aws_ec2_transit_gateway_vpc_attachment.main.vpc_id]
}

output "vpc_owner_id" {
  description = "The ID of the VPC Owner configured in the Transit Gateway Attachment VPC"
  value       = [aws_ec2_transit_gateway_vpc_attachment.main.vpc_owner_id]
}
