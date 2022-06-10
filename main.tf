
resource "random_pet" "bucket_name" {
  prefix = var.random_name_prefix
  length = var.random_name_prefix_lenght
}
resource "random_pet" "object_name" {
  prefix = var.random_name_prefix
  length = 2
}

module "aws_s3_bucket" {
  source = "./Terraform-aws-s3-bucket"

  bucket          = random_pet.bucket_name.id
  destroy         = var.force_destroy_bucket
  bucket_acl_type = var.bucket_acl_type
  //create_object   = true
  key             = "${random_pet.object_name.id}.${var.archive_type}"
  //object_source   = data.archive_file.archive_data.output_path
  object_source = "${path.root}/hello-world/"
  obj_lock_enabled= false
  tagtype={
    Name        = "My bucket"
    Environment = "Dev"
  }
}
module "aws_lambda" {

  source           = "./Terraform-aws-lambda"
  function_name    = var.function_name
 // s3_bucket        = module.aws_s3_bucket.s3_bucket_id
 // s3_key           = module.aws_s3_bucket.s3_object_key
  filename         = data.archive_file.archive_data.output_path
  runtime          = "nodejs12.x"
  handler          = "hello.handler"
  source_code_hash = data.archive_file.archive_data.output_base64sha256
  iam_role         = aws_iam_role.lambda_exec.arn
  statement_id     = "AllowExecutionFromAPIGateway"
  action           = "lambda:InvokeFunction"
  lambda_principal = "apigateway.amazonaws.com"
  source_arn       = "${module.api_gateway.execution_arn}/*/*"
}
///////////////////////////////////////////////////////////////////////////////////
resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${module.aws_lambda.lambda_function_name}"
  retention_in_days = 30
}
resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${module.api_gateway.gatewayname}"
  retention_in_days = 30
}
///////////////////////////////////////////////////////////////////////////////////
resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
/////////////////////////////////////////////////////////////////
module "api_gateway" {
  source= "./Terraform-aws-api-gtw"
  api_gateway_name="serverless_lambda"
  protocol_type="HTTP"
  destination_arn = aws_cloudwatch_log_group.api_gw.arn
  integration_uri    = module.aws_lambda.lambda_invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
  route_key = "GET /hello"
}
