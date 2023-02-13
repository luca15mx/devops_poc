# #################################################################################
#
#  REQUIRED TERRAFORM AND PROVIDERS VERSIONS
#
# #################################################################################

terraform {
  required_version = ">= 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    null = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }

    random = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }
}
