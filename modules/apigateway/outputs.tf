# Output the API Gateway REST API ID
output "api_gateway_rest_api_id" {
  description = "The ID of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.my_api.id
}

# Output the Root Resource ID of the API Gateway
output "api_gateway_root_resource_id" {
  description = "The root resource ID of the API Gateway"
  value       = aws_api_gateway_rest_api.my_api.root_resource_id
}

# Output the Full Execution ARN of the API
output "api_gateway_execution_arn" {
  description = "The full execution ARN of the API Gateway"
  value       = aws_api_gateway_rest_api.my_api.execution_arn
}

# Output the Resource ID for /doOrder
output "api_resource_id" {
  description = "The resource ID for the /doOrder path"
  value       = aws_api_gateway_resource.api_resource.id
}

# Output the Authorizer ID
output "api_gateway_authorizer_id" {
  description = "The ID of the custom authorizer for the API Gateway"
  value       = aws_api_gateway_authorizer.my_auth.id
}

# Output the Authorizer URI
output "api_gateway_authorizer_uri" {
  description = "The URI of the Lambda function used in the custom authorizer"
  value       = aws_api_gateway_authorizer.my_auth.authorizer_uri
}

# Output Method HTTP Method
output "api_method_http_method" {
  description = "The HTTP method for the API method"
  value       = aws_api_gateway_method.api_method.http_method
}

# Output Lambda Permission Source ARN
output "lambda_permission_source_arn" {
  description = "The source ARN defined for Lambda permissions"
  value       = aws_lambda_permission.allow_api_gateway.source_arn
}