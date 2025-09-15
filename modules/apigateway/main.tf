provider "aws" {
  region = var.region
}

data "aws_partition" "current" {}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_apigateway_rest_api" "my_api" {
  name        = var.my_api
  region      = var.region
  description = "An my API with custom authorization."
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_apigateway_resource" "api_resource" {
  rest_api_id = aws_apigateway_rest_api.my_api.id
  parent_id   = aws_apigateway_rest_api.my_api.root_resource_id #make it a variable
  path_part   = "doOrder"
}

resource "aws_apigateway_method" "api_method" {
  rest_api_id   = aws_apigateway_rest_api.my_api.id
  resource_id   = aws_apigateway_resource.api_resource.id
  http_method   = "POST"
  authorization = "CUSTOM"
  authorizer_id = aws_apigateway_authorizer.my_auth.id

  # Use module outputs for dependency
  depends_on = [
    module.lambda_authorizer.aws_lambda_function.auth_lambda,
    aws_apigateway_authorizer.my_auth
  ]
}

resource "aws_apigateway_authorizer" "my_auth" {
  name                             = var.authorizer_name
  rest_api_id                      = aws_apigateway_rest_api.my_api.id
  authorizer_uri                   = module.lambda_authorizer.aws_lambda_function.auth_lambda.invoke_arn
  identity_source                  = "method.request.header.Authorization"
  type                             = "TOKEN"
  authorizer_result_ttl_in_seconds = 300
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda_authorizer.aws_lambda_function.auth_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigateway_rest_api.my_api.execution_arn}/*/*"
}