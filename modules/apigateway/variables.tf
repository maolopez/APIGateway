variable "region" {
  type        = string
  description = "default region"
}

variable "api_name" {
  type        = string
  description = "The API name"
}

variable "authorizer_name" {
  type        = string
  description = "The name of the API Gateway's authorizer"
}

variable "lambda_authorizer_arn" {
  description = "The ARN of the Lambda function to be used as the authorizer"
  type        = string
}