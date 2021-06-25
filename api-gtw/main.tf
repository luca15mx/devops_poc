# #################################################################################
# Creates the Api-Gateway
#
# MRHF 23-JUN-2021 21:13
#
# #################################################################################

# #################################################################################
#  CREATES THE API-GATEWAY, ROUTES AND DEPLOYMENTS
#
# #################################################################################

resource "aws_apigatewayv2_api" "api-gtw" {
  name                       = var.mapi-gtw-name
  protocol_type              = var.mapi-gtw-protocol
  route_selection_expression = var.mapi-gtw-route-selection
  tags                       = var.mapi-gtw-common_tags
}

# ROUTE CONNECT

resource "aws_apigatewayv2_integration" "api-gtw-ri-lambda-connect" {
  api_id           = aws_apigatewayv2_api.api-gtw.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda function"
  integration_method        = "POST"
  integration_uri           = var.mapi-gtw-lambda_ws_connect_uri
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_route" "api-gtw-ri-connect" {
  api_id    = aws_apigatewayv2_api.api-gtw.id
  route_key = "$connect"
  target    = "integrations/${aws_apigatewayv2_integration.api-gtw-ri-lambda-connect.id}"
}

# ROUTE DISCONNECT

resource "aws_apigatewayv2_integration" "api-gtw-ri-lambda-disconnect" {
  api_id           = aws_apigatewayv2_api.api-gtw.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda function"
  integration_method        = "POST"
  integration_uri           = var.mapi-gtw-lambda_ws_disconnect_uri
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_route" "api-gtw-ri-disconnect" {
  api_id    = aws_apigatewayv2_api.api-gtw.id
  route_key = "$disconnect"
  target    = "integrations/${aws_apigatewayv2_integration.api-gtw-ri-lambda-disconnect.id}"
}

# resource "aws_apigatewayv2_integration_response" "example" {
#   api_id                   = aws_apigatewayv2_api.api-gtw.id
#   integration_id           = aws_apigatewayv2_integration.api-gtw-ri-lambda-connect.id
#   integration_response_key = "/200/"
# }

# STAGES AND DEPLOYMENT

resource "aws_apigatewayv2_stage" "api-gtw-stage" {
  api_id        = aws_apigatewayv2_api.api-gtw.id
  name          = var.mapi-gtw-stage_name
  deployment_id = aws_apigatewayv2_deployment.api-gtw-deployment.id
}

resource "aws_apigatewayv2_deployment" "api-gtw-deployment" {
  api_id      = aws_apigatewayv2_api.api-gtw.id
  description = "Development deployment"

  lifecycle {
    create_before_destroy = true
  }
}

# MONITORING

resource "aws_api_gateway_account" "api-gtw-cw-logs" {
  cloudwatch_role_arn = var.mapi_gtw-cw-role_arn
}
