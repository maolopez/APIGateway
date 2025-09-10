output "pool_id" {
  value = aws_cognito_user_pool.my_pool.id
}

output "user_client_id" {
  value = aws_cognito_user_pool_client.my_client.id
}