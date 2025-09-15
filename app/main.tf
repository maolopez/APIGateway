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
  source          = "../apigateway"
  region          = local.region
  api_name        = local.api_name
  authorizer_name = local.authorizer_name
}

module "lambda_authorizer" {
  source        = "../lambda"
  region        = local.region
  function_name = local.function_name
  rp_name       = local.rp_name
  policy_name   = local.policy_name
}