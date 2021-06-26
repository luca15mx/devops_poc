# #################################################################################
#
#  OUTPUTS FOR LAMBDA MODULE
#
# #################################################################################

output "exp_mlambda_ws_default_uri" {
  value = aws_lambda_function.ws_crud_default_lambda.invoke_arn
}

output "exp_mlambda_ws_connect_uri" {
  value = aws_lambda_function.ws_crud_connect_lambda.invoke_arn
}

output "exp_mlambda_ws_disconnect_uri" {
  value = aws_lambda_function.ws_crud_disconnect_lambda.invoke_arn
}
