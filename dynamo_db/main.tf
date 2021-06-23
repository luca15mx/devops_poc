# #################################################################################
# Creates POC Lambda-DynamoDB-ApiGateway Reader
#
# MRHF 22-JUN-2022 23:38
#
# #################################################################################

# #################################################################################
#  Creates the DynamoDB Table
#
# #################################################################################
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = var.mdyn_db_db_name
  billing_mode   = var.mdyn_db_billing_mode
  write_capacity = var.mdyn_db_write_capacity
  read_capacity  = var.mdyn_db_read_capacity
  hash_key       = var.mdyn_db_hash_key

  attribute {
    name = "ID"
    type = "N"
  }

  attribute {
    name = "Word"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "WordIndex"
    hash_key           = "ID"
    range_key          = "Word"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["Word"]
  }

  tags = var.mdyn_db_tags
}
