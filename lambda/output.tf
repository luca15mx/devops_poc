output "exp_mlambda_arn" {
  value = aws_lambda_function.http_crud_lambda.arn
}

output "exp_mlambda_uri" {
  value = aws_lambda_function.http_crud_lambda.invoke_arn
}
