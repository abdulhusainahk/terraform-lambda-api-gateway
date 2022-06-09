output "lambda_function_name" {
  description = "lambda function name."
  value = aws_lambda_function.aws_lambda.function_name
}
output "lambda_invoke_arn" {
  value = aws_lambda_function.aws_lambda.invoke_arn
}