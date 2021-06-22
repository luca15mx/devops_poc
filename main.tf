provider "aws" {
  region = var.region
}

# Backend configuration
terraform {
  backend "s3" {
    bucket = "s3-terraform-devops-poc-mrhf-1175"
    key    = "poc-ddevops/"
    region = "us-east-1"
  }
}

module "dynamodb_table_1" {
  source = "/dynamo_db"

  name              = "first"
  hash_key          = "HashKey"
  range_key         = "RangeKey"
  enable_autoscaler = true

  dynamodb_attributes = [
    {
      name = "word"
      type = "N"
    }
  ]

  local_secondary_index_map = [
    {
      name               = "TimestampSortIndex"
      range_key          = "Timestamp"
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    },
    {
      name               = "HighWaterIndex"
      range_key          = "Timestamp"
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]

  global_secondary_index_map = [
    {
      name               = "DailyAverageIndex"
      hash_key           = "DailyAverage"
      range_key          = "HighWater"
      write_capacity     = 5
      read_capacity      = 5
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]

  context = module.this.context
}
