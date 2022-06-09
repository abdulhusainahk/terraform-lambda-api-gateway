resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  force_destroy = var.destroy
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.bucket_acl_type
}

resource "aws_s3_object" "s3_object" {
  count=var.create_object?1:0
  bucket = aws_s3_bucket.bucket.id
  key    = var.key
  source = var.object_source
  etag = filemd5(var.object_source)
}