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
  default = "http-crud-function.handler"
}

variable "gv_lambda_runtime" {
  type    = string
  default = "nodejs14.x"
}

variable "gv_lambda_s3_code_key_file" {
  default = "v1.0.0/http-crud-function.zip"
}

variable "gv_lambda_function_name" {
  default = "http-crud-function"
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
