resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

module "cognito" {
  source = "../modules/cognito"

  region      = local.region
  pool_name   = local.pool_name
  client_name = local.client_name
  username    = local.username
  domain      = local.domain
}

module "api" {
  source                = "../modules/apigateway"
  region                = local.region
  api_name              = local.api_name
  authorizer_name       = local.authorizer_name
  lambda_authorizer_arn = module.lambda_authorizer.lambda_function_arn
}

module "lambda_authorizer" {
  source                    = "../modules/lambda"
  region                    = local.region
  function_name             = local.function_name
  rp_name                   = local.rp_name
  policy_name               = local.policy_name
  api_gateway_execution_arn = module.api.api_gateway_execution_arn
}