# Output value definitions

output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."
  value = module.aws_s3_bucket.s3_bucket_id
}
output "function_name" {
  description = "Name of the Lambda function."
  value = module.aws_lambda.lambda_function_name
}
output "base_url" {
  description = "Base URL for API Gateway stage."
  value = module.api_gateway.invoke_url
  sensitive = true
}
output "s3_object_key" {
  description = "S3 obeject key."
  value       = module.aws_s3_bucket.s3_object_key
  sensitive = true //prevent key to be seen in cli 
}
