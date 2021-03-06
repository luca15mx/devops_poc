# #################################################################################
# Creates POC Lambda-DynamoDB-ApiGateway Reader
#
# MRHF 22-JUN-2022 23:38
#
# #################################################################################

# #################################################################################
#  Outputs for Root Module
#
# #################################################################################
# output "gexp_dydb_arn" {
#   value = module.dynamodb_table.exp_mdyn_db_arn
# }

# output "gexp_s3_for_lambdas" {
#   description = "S3 Bucket for Lambda Code ARN"
#   value       = module.s3.exp_s3_bucket_config_id
# }

# output "gexp_lambda_exec_role_arn" {
#   value = module.iam.exp_iam_lambda_role_arn
# }
#
# output "gexp_cw_log_group_arn" {
#   value = module.cw_logs.mcw_cw_log_group_arn
# }

# output "gexp_api-gtw_endpoint" {
#   value = module.api-gtw2.mapi-gtw-endpoint
# }

output "URI_Lambda_Connect" {
  value = module.lambda.exp_mlambda_ws_connect_uri
}

output "URI_Lambda_Disconnect" {
  value = module.lambda.exp_mlambda_ws_disconnect_uri
}

output "URI_Lambda_Default" {
  value = module.lambda.exp_mlambda_ws_default_uri
}

output "WSS_Invoke_URL" {
  value = module.api-gtw2.mapi-gtw-wss-invoke-url
}
