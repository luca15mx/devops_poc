output "mcw_cw_log_group_arn" {
  value = aws_cloudwatch_log_group.ws-crud-items.arn
}

output "mcw_cw_log_group_ws_connect_arn" {
  value = aws_cloudwatch_log_group.ws-crud-connect.arn
}

output "mcw_cw_log_group_ws_disconnect_arn" {
  value = aws_cloudwatch_log_group.ws-crud-disconnect.arn
}
