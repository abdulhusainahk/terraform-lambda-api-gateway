resource "aws_lambda_function" "aws_lambda" {
  function_name = var.function_name
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  filename = var.filename
  runtime          =var.runtime
  handler          =var.handler
  source_code_hash = var.source_code_hash
  role             = var.iam_role
}
resource "aws_lambda_permission" "lambda_security" {
  statement_id  =var.statement_id
  action        = var.action
  function_name = var.function_name
  principal     = var.lambda_principal
  source_arn = var.source_arn
}
