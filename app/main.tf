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
}