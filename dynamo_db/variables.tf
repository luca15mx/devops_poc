# #################################################################################
# Creates POC Lambda-DynamoDB-ApiGateway Reader
#
# MRHF 22-JUN-2022 23:38
#
# #################################################################################

# #################################################################################
# Variables for DynamoDB Module
#
# #################################################################################

variable "mdyn_db_db_name" {
  type = string
}

variable "mdyn_db_billing_mode" {
  type = string
  # default = "PROVISIONED"
}

variable "mdyn_db_read_capacity" {
  type = number
  # default = 20
}

variable "mdyn_db_write_capacity" {
  type = number
  # default = 20
}

variable "mdyn_db_hash_key" {
  type = string
  # default = "ID"
}

# variable "mdyn_db_range_key" {
#   type = string
#   # default = "word"
# }

variable "mdyn_db_tags" {
  type = map
}
