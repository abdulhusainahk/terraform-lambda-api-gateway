# Input variable definitions

variable "aws_region" {
  description = "AWS region for all resources."
  type    = string
  default = "us-west-1"
}
variable "random_name_prefix" {
  type    = string
  default = "terraform"
}
variable "random_name_prefix_lenght" {
  type    = number
  default = 4
}
variable "force_destroy_bucket" {
  type    = bool
  default = true
}
variable "bucket_acl_type" {
  type    = string
  default = "private"
}
variable "archive_type" {
  type    = string
  default = "zip"
}
variable "archive_folder" {
  type    = string
  default = "hello-world"
}
variable "bucket-key" {
  type    = string
  default = "my-bucket"
}
variable "function_name" {
  type    = string
  default = "demo-function"
}