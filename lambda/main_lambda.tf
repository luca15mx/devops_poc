################################################################################
#
#  Module to upload and create the Lambda function.
#
#  MHRF 23/06/2021  14:50
#
################################################################################

resource "aws_lambda_function" "ws_crud_lambda" {
  function_name = var.mlambda_function_name
  s3_bucket     = var.mlambda_s3_bucket_arn
  s3_key        = var.mlambda_s3_code_key_file
  handler       = var.mlambda_handler
  runtime       = var.mlambda_runtime
  role          = var.mlambda_iam_exec_role_arn
  tags          = var.mlambda_common_tags
}

resource "aws_lambda_function" "ws_crud_connect_lambda" {
  function_name = var.mlambda_connect_function_name
  s3_bucket     = var.mlambda_s3_bucket_arn
  s3_key        = var.mlambda_s3_connect_code_key_file
  handler       = var.mlambda_connect_handler
  runtime       = var.mlambda_connect_runtime
  role          = var.mlambda_iam_exec_role_arn
  tags          = var.mlambda_common_tags
}

resource "aws_lambda_function" "ws_crud_disconnect_lambda" {
  function_name = var.mlambda_disconnect_function_name
  s3_bucket     = var.mlambda_s3_bucket_arn
  s3_key        = var.mlambda_s3_disconnect_code_key_file
  handler       = var.mlambda_disconnect_handler
  runtime       = var.mlambda_disconnect_runtime
  role          = var.mlambda_iam_exec_role_arn
  tags          = var.mlambda_common_tags
}
