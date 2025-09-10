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

