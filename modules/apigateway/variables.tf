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