variable "bucket" {
  type = string
  default = null
}
variable "destroy" {
  type = bool
  default = true
}
variable "bucket_acl_type" {
  type = string
  default = "private"
}
variable "archive_type" {
  type = string
  default = "zip"
}
variable "source_dir" {
  type = string
  default = null
}
variable "key" {
  type = string
  default = "my-key"
}
variable "create_object" {
  type=bool
  default=false
}
variable "object_source" {
  type=string
}