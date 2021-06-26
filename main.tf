# #################################################################################
# Creates POC Lambda-DynamoDB-ApiGateway Reader
#
# MRHF 22-JUN-2022 23:38
#
# #################################################################################

# #################################################################################
#  Creates the S3 For TFState
#
# #################################################################################

provider "aws" {
  region = var.gv_aws_region
}

# Backend configuration
# terraform {
#   backend "s3" {
#     bucket = "s3-terraform-devops-poc-mrhf-1175"
#     key    = "poc-ddevops/"
#     region = "us-east-1"
#   }
# }

module "dynamodb_table" {
  source                 = "./dynamo_db"
  mdyn_db_db_name        = var.gv_dyn_db_db_name
  mdyn_db_range_key      = var.gv_dyn_db_range_key
  mdyn_db_hash_key       = var.gv_dyn_db_hash_key
  mdyn_db_write_capacity = var.gv_dyn_db_write_capacity
  mdyn_db_read_capacity  = var.gv_dyn_db_read_capacity
  mdyn_db_billing_mode   = var.gv_dyn_db_billing_mode
  mdyn_db_tags           = var.gv_common_tags
}

module "cw_logs" {
  source                        = "./cloudwatch"
  mcw_tags                      = var.gv_common_tags
  mcw_log_group_name            = var.gv_lambda_function_name
  mcw_log_group_connect_name    = var.gv_lambda_connect_function_name
  mcw_log_group_disconnect_name = var.gv_lambda_disconnect_function_name
  mcw_retention_days            = var.gv_retention_days
}

# module "s3" {
#   source                = "./s3"
#   ms3_enable_versioning = var.gv_s3_enable_versioning
#   ms3_force_destroy     = var.gv_s3_force_destroy
#   ms3_common_tags       = var.gv_common_tags
# }

module "iam" {
  source           = "./iam"
  miam_common_tags = var.gv_common_tags
}

module "lambda" {
  source                              = "./lambda"
  mlambda_function_name               = var.gv_lambda_function_name
  mlambda_s3_bucket_arn               = var.gv_s3_for_lambda_code
  mlambda_handler                     = var.gv_lambda_handler
  mlambda_runtime                     = var.gv_lambda_runtime
  mlambda_s3_code_key_file            = var.gv_lambda_s3_code_key_file
  mlambda_connect_function_name       = var.gv_lambda_connect_function_name
  mlambda_s3_connect_code_key_file    = var.gv_lambda_s3_connect_code_key_file
  mlambda_connect_handler             = var.gv_lambda_connect_handler
  mlambda_connect_runtime             = var.gv_lambda_connect_runtime
  mlambda_disconnect_function_name    = var.gv_lambda_disconnect_function_name
  mlambda_s3_disconnect_code_key_file = var.gv_lambda_s3_disconnect_code_key_file
  mlambda_disconnect_handler          = var.gv_lambda_disconnect_handler
  mlambda_disconnect_runtime          = var.gv_lambda_disconnect_runtime
  mlambda_common_tags                 = var.gv_common_tags
  mlambda_iam_exec_role_arn           = module.iam.exp_iam_lambda_role_arn
}

module "api-gtw-ws" {
  source                            = "./api-gtw"
  mapi-gtw-common_tags              = var.gv_common_tags
  mapi-gtw-name                     = var.gv_api-gtw-name
  mapi-gtw-protocol                 = var.gv_api-gtw-protocol
  mapi-gtw-route-selection          = var.gv_api-gtw-route-selection
  mapi-gtw-stage_name               = var.gv_api-gtw-stage-name
  mapi-gtw-lambda_uri               = module.lambda.exp_mlambda_uri
  mapi-gtw-lambda_ws_connect_uri    = module.lambda.exp_mlambda_ws_connect_uri
  mapi-gtw-lambda_ws_disconnect_uri = module.lambda.exp_mlambda_ws_disconnect_uri
  mapi_gtw-cw-role_arn              = module.iam.exp_iam_cloudwatch-role-api-gtw
}
