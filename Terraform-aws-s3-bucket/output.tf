output "s3_bucket_id" {
  description = "S3 bucket id."

  value = aws_s3_bucket.bucket.id
}
output "s3_object_key" {
  description = "S3 obeject key."
  value =  aws_s3_object.s3_object[*]
}
