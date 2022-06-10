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
variable "use_for_lambda" {
  type=bool
  default=false
}
variable "object_source" {
  type=string
}
variable "tagtype" {
  type=map(string)
}
variable "obj_lock_enabled" {
  type = bool
  default = false
}