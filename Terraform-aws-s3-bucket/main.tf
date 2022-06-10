resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  force_destroy = var.destroy
  object_lock_enabled= var.obj_lock_enabled
  tags = var.tagtype
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.bucket_acl_type
}

resource "aws_s3_object" "s3_object" {
  //count=var.create_object?1:0
  for_each = fileset( var.object_source,"**" )
  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "${var.object_source}${each.value}"
  etag = filemd5("${var.object_source}${each.value}")
}
