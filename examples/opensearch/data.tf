data "aws_cloudformation_export" "web_subnet_a" {
  name = var.cf_export_web_subnet_a
}

data "aws_cloudformation_export" "web_subnet_b" {
  name = var.cf_export_web_subnet_b
}

data "aws_cloudformation_export" "app_sg_id" {
  name = var.cf_export_app_sg_id
}
