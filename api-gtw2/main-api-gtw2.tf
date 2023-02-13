# #################################################################################
# Creates the Api-Gateway
#
# MRHF 25-JUN-2021 19:55
#
# #################################################################################

# #################################################################################
#  CREATES THE API-GATEWAY, ROUTES AND DEPLOYMENTS
#   
# #################################################################################
resource "aws_apigatewayv2_api" "api-gtw2" {
  name                       = "apigtw-ws-amwell"
  protocol_type              = "WEBSOCKET"
  route_selection_expression = "$request.body.action"
  tags                       = var.mapi-gtw-common_tags
}

resource "aws_apigatewayv2_route" "rote-connect" {
  api_id    = aws_apigatewayv2_api.api-gtw2.id
  route_key = "$connect"
  target    = "integrations/${aws_apigatewayv2_integration.lambda-connect.id}"
}

resource "aws_apigatewayv2_integration" "lambda-connect" {
  api_id           = aws_apigatewayv2_api.api-gtw2.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "API Gateway 2"
  integration_method        = "POST"
  integration_uri           = var.mapi-gtw-lambda_ws_connect_uri
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_route" "route-disconnect" {
  api_id    = aws_apigatewayv2_api.api-gtw2.id
  route_key = "$disconnect"
  target    = "integrations/${aws_apigatewayv2_integration.lambda-disconnect.id}"
}

resource "aws_apigatewayv2_integration" "lambda-disconnect" {
  api_id           = aws_apigatewayv2_api.api-gtw2.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "API Gateway 2"
  integration_method        = "POST"
  integration_uri           = var.mapi-gtw-lambda_ws_disconnect_uri
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_route" "route-default" {
  api_id    = aws_apigatewayv2_api.api-gtw2.id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.lambda-default.id}"
}

resource "aws_apigatewayv2_integration" "lambda-default" {
  api_id           = aws_apigatewayv2_api.api-gtw2.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "API Gateway 2"
  integration_method        = "POST"
  integration_uri           = var.mapi-gtw-lambda_ws_default_uri
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_integration_response" "integration-response-default" {
  api_id                   = aws_apigatewayv2_api.api-gtw2.id
  integration_id           = aws_apigatewayv2_integration.lambda-default.id
  integration_response_key = "/200/"
}

resource "aws_apigatewayv2_route_response" "route-response-default" {
  api_id             = aws_apigatewayv2_api.api-gtw2.id
  route_id           = aws_apigatewayv2_route.route-default.id
  route_response_key = "$default"
}

resource "aws_apigatewayv2_stage" "api-gtw-stage" {
  api_id = aws_apigatewayv2_api.api-gtw2.id
  name   = var.mapi-gtw-stage_name
}

resource "aws_apigatewayv2_deployment" "api-gtw-deployment" {
  api_id      = aws_apigatewayv2_api.api-gtw2.id
  description = "Dev Deployment"

  lifecycle {
    create_before_destroy = true
  }
}
