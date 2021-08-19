###############################################################################
### TRANSIT GATEWAY ROUTES
###############################################################################

# Create a route on each Route Table for every Transit Gateway Route CIDR
locals {
  route_table_id_cidrs = flatten([
    for route_table_id in var.route_table_ids : [
      for cidr in var.transit_gateway_route_cidrs : {
        route_table_id = route_table_id
        cidr           = cidr
      }
    ]
  ])
}

# TRANSIT GATEWAY ROUTES
resource "aws_route" "main" {
  for_each = {
    for rtc in local.route_table_id_cidrs : "${rtc.route_table_id}.${rtc.cidr}" => rtc
  }

  route_table_id         = each.value.route_table_id
  destination_cidr_block = each.value.cidr
  transit_gateway_id     = var.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.main]
}
