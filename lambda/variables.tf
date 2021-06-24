variable "mlambda_s3_bucket_arn" {
  type = string
}

variable "mlambda_handler" {
  type = string
}

variable "mlambda_runtime" {
  type = string
}

variable "mlambda_iam_exec_role_arn" {
  type = string
}

variable "mlambda_s3_code_key_file" {
  type = string
}

variable "mlambda_common_tags" {
  type = map
}

variable "mlambda_function_name" {
  type = string
}
