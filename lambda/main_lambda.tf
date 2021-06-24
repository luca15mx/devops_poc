# # IAM role which dictates what other AWS services the Lambda function
# # may access.
# resource "aws_iam_role_policy" "lambda_policy" {
#   name   = "lambda_policy"
#   role   = aws_iam_role.lambda_exec.id
#   policy = file("./lambda/policies/iam_cwlogs_for_lambda.json")
# }
#
# resource "aws_iam_role" "lambda_exec" {
#   name               = "lambda_exec_role"
#   assume_role_policy = file("./lambda/policies/iam_assume_policy_lambda_exec.json")
#   tags               = var.mlambda_common_tags
# }

resource "aws_lambda_function" "http_crud_lambda" {
  function_name = var.mlambda_function_name
  s3_bucket     = var.mlambda_s3_bucket_arn
  s3_key        = var.mlambda_s3_code_key_file
  handler       = var.mlambda_handler
  runtime       = var.mlambda_runtime
  # role          = aws_iam_role.lambda_exec.arn
  role = var.mlambda_iam_exec_role_arn
  tags = var.mlambda_common_tags
}
