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
variable "abs_folder_name" {
  type=string
  default="hello-world"
}
variable "object_lock_enabled" {
  type=bool
  default=false
}
variable "runtime_env" {
  type = string
  default = "nodejs12.x"
}
variable "runtime_handler" {
  type=string
  default="hello.handler"
}
variable "policies" {
  type=list(string)
  default = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole","arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}
variable "iam_role_services" {
  type=list(string)
  default =["lambda.amazonaws.com","ecs.amazonaws.com"]
}