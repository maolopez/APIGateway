provider "aws" {
  region = var.region
}

data "aws_partition" "current" {}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_cognito_user_pool" "my_pool" {
  name                     = var.pool_name
  region                   = var.region
  auto_verified_attributes = ["email"]

}

resource "aws_cognito_user_pool_client" "my_client" {
  name         = var.client_name
  user_pool_id = aws_cognito_user_pool.my_pool.id
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_CUSTOM_AUTH"
  ]

  # OAuth 2.0 configuration
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["email", "openid", "profile"]
  callback_urls                        = ["https://yourapp.example.com/oauth2/idpresponse"]
  allowed_oauth_flows_user_pool_client = true

  # Secret is optional, depends on the required security
  generate_secret = false
}

resource "aws_cognito_user" "my_user" {
  user_pool_id = aws_cognito_user_pool.my_pool.id
  username     = var.username
  attributes = {
    email = var.username
  }
  temporary_password = "Temporary123!"
  depends_on         = [aws_cognito_user_pool_client.my_client]
}

# Define Cognito User Pool Domain
resource "aws_cognito_user_pool_domain" "my_pool_domain" {
  domain       = "your-domain-prefix"
  user_pool_id = aws_cognito_user_pool.my_pool.id
}

/*
# Optionally, define Identity Pool (not required strictly for OAuth)
resource "aws_cognito_identity_pool" "example_identity_pool" {
  identity_pool_name = "example_identity_pool"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id = aws_cognito_user_pool_client.example_pool_client.id
    provider_name = aws_cognito_user_pool.example_pool.endpoint
  }
}
*/

