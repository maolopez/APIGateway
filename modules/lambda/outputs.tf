# Output the Lambda Function Name
output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.auth_lambda.function_name
}

# Output the Lambda Function ARN
output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.auth_lambda.arn
}

# Output the Lambda Execution Role ARN
output "lambda_execution_role_arn" {
  description = "The ARN of the IAM role used by the Lambda function"
  value       = aws_iam_role.lambda_execution_role.arn
}

# Output the Lambda Function Handler
output "lambda_function_handler" {
  description = "The handler set for the Lambda function"
  value       = aws_lambda_function.auth_lambda.handler
}

# Output the Lambda Function Runtime
output "lambda_function_runtime" {
  description = "The runtime environment for the Lambda function"
  value       = aws_lambda_function.auth_lambda.runtime
}