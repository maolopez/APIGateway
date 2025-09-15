locals {
  region          = "us-east-1"
  awsaccount      = "967927620777"
  pool_name       = "pool-${random_string.suffix.result}"
  client_name     = "appclient-${random_string.suffix.result}"
  username        = "my@domain.com"
  domain          = "any-${random_string.suffix.result}"
  api_name        = "api-${random_string.suffix.result}"
  authorizer_name = "auth-${random_string.suffix.result}"
  function_name   = "lambda-${random_string.suffix.result}"
  rp_name         = "rp-${random_string.suffix.result}"
  policy_name     = "policy-${random_string.suffix.result}"
}