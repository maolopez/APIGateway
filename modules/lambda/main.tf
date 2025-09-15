provider "aws" {
  region = var.region
}

data "aws_partition" "current" {}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

# Lambda Function Definition
resource "aws_lambda_function" "auth_lambda" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "return_auth.lambda_handler" #  The handler is expressed in the format filename.function_name
  runtime       = "python3.9"                  # Adjust this to your preferred runtime

  # Path to the deployment package (a .zip file)
  filename         = "../modules/lambda/package.zip"
  source_code_hash = filebase64sha256("../modules/lambda/package.zip")

}

# Lambda Permission for API Gateway to invoke the Lambda
resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.auth_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_gateway_execution_arn}/*/*"
}