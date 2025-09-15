variable "region" {
  type        = string
  description = "default region"
}

variable "function_name" {
  type        = string
  description = "The name of the Lambda authorizer function"
}

variable "rp_name" {
  type        = string
  description = "The name of the Role Policy for Lambda authorizer function"
}

variable "policy_name" {
  type        = string
  description = "The name of the policy for the Role Policy for Lambda authorizer function"
}

variable "api_gateway_execution_arn" {
  type        = string
  description = "pointing to module/apigateway output api_gateway_execution_arn"
}