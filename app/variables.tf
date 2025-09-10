locals {
  region      = "us-east-1"
  awsaccount  = "967927620777"
  pool_name   = "pool-${random_string.suffix.result}"
  client_name = "appclient-${random_string.suffix.result}"
  username    = "my@domain.com"
}