data "aws_caller_identity" "current" {
}

data "aws_region" "current" {
}

data "aws_subnet" "vpc_endpoint" {
  count = var.create_vpc_endpoint ? 1 : 0
  id    = try(var.vpc_endpoint_subnet_ids[0], "")
}

data "aws_vpc_endpoint" "this" {
  count = var.create_vpc_endpoint ? 1 : 0

  vpc_id = data.aws_subnet.vpc_endpoint[0].vpc_id
  tags = {
    "OpenSearchManaged"       = "true"
    "OpenSearchVPCEndpointId" = aws_opensearch_vpc_endpoint.this[0].id
  }
}
