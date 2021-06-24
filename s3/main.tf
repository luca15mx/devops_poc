# #################################################################################
# Creates S3 Bucket to place configuration files for applications and docker images
#
# MRHF 23-JUN-2021 13:52
#
# #################################################################################

# #################################################################################
#  Creates the S3 For Lambda Code
#
# #################################################################################

resource "random_pet" "this" {
  length = 2
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = "s3-lambdas-${random_pet.this.id}"
  acl           = "private"
  force_destroy = var.ms3_force_destroy
  versioning {
    enabled = var.ms3_enable_versioning
  }
  tags = var.ms3_common_tags
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
