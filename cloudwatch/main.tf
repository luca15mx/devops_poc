resource "aws_cloudwatch_log_group" "http-crud-items" {
  name              = "/aws/lambda/${var.mcw_log_group_name}"
  tags              = var.mcw_tags
  retention_in_days = var.mcw_retention_days
}
