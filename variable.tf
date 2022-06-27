variable "access_key" {
  type    = string
  default = ""
}
variable "secret_key" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "environment" {
  type    = string
  default = "development"
}

locals {
  tags = {
    Terraform   = "YES"
    environment = var.environment
  }
}

variable "bucket_name" {
  type    = string
  default = ""
}

