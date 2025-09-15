variable "region" {
  type        = string
  description = "default region"
}

variable "pool_name" {
  type        = string
  description = "The user pool name"
}

variable "client_name" {
  type        = string
  description = "The user pool's client name"
}

variable "username" {
  type        = string
  description = "The user's email"
}

variable "domain" {
  type        = string
  description = "Your domain"
}