output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda_authorizer.lambda_function_arn
}

# Output the Lambda Execution Role ARN
output "lambda_execution_role_arn" {
  description = "The ARN of the IAM role used by the Lambda function"
  value       = module.lambda_authorizer.lambda_execution_role_arn
}