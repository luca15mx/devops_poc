variable "gv_aws_region" {
  default = "us-east-1"
}

variable "gv_dyn_db_db_name" {
  type    = string
  default = "AMWell_dyndb_devops_poc"
}

variable "gv_dyn_db_billing_mode" {
  type    = string
  default = "PROVISIONED"
}

variable "gv_dyn_db_read_capacity" {
  type    = number
  default = 20
}

variable "gv_dyn_db_write_capacity" {
  type    = number
  default = 20
}

variable "gv_dyn_db_hash_key" {
  type    = string
  default = "ID"
}

variable "gv_dyn_db_range_key" {
  type    = string
  default = "word"
}

#  CLOUD WATCH LOG GROUP

variable "gv_retention_days" {
  type    = number
  default = 1
}

# S3 BUCKETS

variable "gv_s3_enable_versioning" {
  type    = bool
  default = true
}

variable "gv_s3_force_destroy" {
  type    = bool
  default = true
}

# FOR LAMBDA

variable "gv_s3_for_lambda_code" {
  default = "s3-for-lambda-code-marhf-1175"
}

variable "gv_lambda_handler" {
  type    = string
  default = "ws-crud-function.handler"
}

variable "gv_lambda_s3_code_key_file" {
  default = "v1.0.0/ws-crud-function.zip"
}

variable "gv_lambda_function_name" {
  default = "ws-crud-function"
}

variable "gv_lambda_runtime" {
  type    = string
  default = "nodejs14.x"
}

variable "gv_lambda_connect_function_name" {
  type    = string
  default = "ws-crud-connect"
}

variable "gv_lambda_disconnect_function_name" {
  type    = string
  default = "ws-crud-disconnect"
}

variable "gv_lambda_s3_connect_code_key_file" {
  type    = string
  default = "v1.0.0/ws-crud-connect.zip"
}

variable "gv_lambda_s3_disconnect_code_key_file" {
  type    = string
  default = "v1.0.0/ws-crud-disconnect.zip"
}

variable "gv_lambda_connect_handler" {
  type    = string
  default = "ws-crud-connect.handler"
}

variable "gv_lambda_disconnect_handler" {
  type    = string
  default = "ws-crud-disconnect.handler"
}

variable "gv_lambda_connect_runtime" {
  type    = string
  default = "nodejs14.x"
}

variable "gv_lambda_disconnect_runtime" {
  type    = string
  default = "nodejs14.x"
}

# API GATEWAY

variable "gv_api-gtw-name" {
  type    = string
  default = "crud-ws-api"
}

variable "gv_api-gtw-protocol" {
  type    = string
  default = "WEBSOCKET"
}

variable "gv_api-gtw-route-selection" {
  type    = string
  default = "$request.body.action"
}

# COMMON TAGS

variable "gv_common_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map
  default = {
    ApplicationName        = "American Well Devops POC"
    CreatedBy              = "EPAM"
    Env                    = "POC"
    ProjectID              = "AMWELL_DEVOPS_POC"
    TerraformScriptVersion = ""
  }
}
