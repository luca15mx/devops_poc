resource "aws_cloudwatch_log_group" "ws-crud-items" {
  name              = "/aws/lambda/${var.mcw_log_group_name}"
  tags              = var.mcw_tags
  retention_in_days = var.mcw_retention_days
}

resource "aws_cloudwatch_log_group" "ws-crud-connect" {
  name              = "/aws/lambda/connect/${var.mcw_log_group_connect_name}"
  tags              = var.mcw_tags
  retention_in_days = var.mcw_retention_days
}

resource "aws_cloudwatch_log_group" "ws-crud-disconnect" {
  name              = "/aws/lambda/disconnect/${var.mcw_log_group_disconnect_name}"
  tags              = var.mcw_tags
  retention_in_days = var.mcw_retention_days
}
