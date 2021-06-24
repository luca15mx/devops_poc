# #################################################################################
# Creates the Api-Gateway
#
# MRHF 23-JUN-2021 21:13
#
# #################################################################################

# #################################################################################
#  Creates the S3 For Lambda Code
#
# #################################################################################

resource "aws_apigatewayv2_api" "api-gtw" {
  name                       = var.mapi-gtw-name
  protocol_type              = var.mapi-gtw-protocol
  route_selection_expression = var.mapi-gtw-route-selection
  tags                       = var.mapi-gtw-common_tags
}

resource "aws_apigatewayv2_route" "api-gtw-ri" {
  api_id    = aws_apigatewayv2_api.api-gtw.id
  route_key = "$connect"
}

resource "aws_apigatewayv2_integration" "api-gtw-ri-lambda" {
  api_id           = aws_apigatewayv2_api.api-gtw.id
  integration_type = "AWS"

  connection_type           = "INTERNET"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda example"
  integration_method        = "POST"
  integration_uri           = var.mapi-gtw-lambda_arn
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_integration_response" "example" {
  api_id                   = aws_apigatewayv2_api.api-gtw.id
  integration_id           = aws_apigatewayv2_integration.api-gtw-ri-lambda.id
  integration_response_key = "/200/"
}

resource "aws_apigatewayv2_stage" "api-gtw-stage" {
  api_id = aws_apigatewayv2_api.api-gtw.id
  name   = "dev-stage"
}

resource "aws_api_gateway_account" "api-gtw-cw-logs" {
  cloudwatch_role_arn = var.mapi_gtw-cw-role_arn
}
