variable "function_name" {
  type=string
}
variable "s3_bucket" {
  type=string
  default = null
}
variable "s3_key" {
  type=string
  default = null
}
variable "runtime" {
  type=string
}
variable "handler" {
  type=string
}
variable "source_code_hash" {
  type=string
}
variable "iam_role" {
  type=string
}
variable "filename" {
  type=string
  default=null
}
variable "statement_id" {
  type=string
}
variable "action" {
  type=string
}
variable "lambda_principal" {
  type=string
}
variable "source_arn" {
  type=string
}