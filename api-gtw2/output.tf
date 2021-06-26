# #################################################################################
#
#  OUTPUTS FOR API-GATEWAY MODULE
#
# #################################################################################
output "mapi-gtw-endpoint" {
  value = aws_apigatewayv2_api.api-gtw2.api_endpoint
}

output "mapi-gtw-wss-invoke-url" {
  value = aws_apigatewayv2_stage.api-gtw-stage.invoke_url
}
