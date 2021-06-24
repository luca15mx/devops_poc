################################################################################
#
#  Module to upload and create the Lambda function.
#
#  MHRF 23/06/2021  14:50
#
################################################################################

resource "aws_lambda_function" "http_crud_lambda" {
  function_name = var.mlambda_function_name
  s3_bucket     = var.mlambda_s3_bucket_arn
  s3_key        = var.mlambda_s3_code_key_file
  handler       = var.mlambda_handler
  runtime       = var.mlambda_runtime
  role          = var.mlambda_iam_exec_role_arn
  tags          = var.mlambda_common_tags
}
