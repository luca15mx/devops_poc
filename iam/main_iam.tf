
################################################################################
#
#  MAIN MODULE FOR IAM
#
################################################################################

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role_policy" "lambda_policy" {
  name   = "lambda_policy"
  role   = aws_iam_role.lambda_exec.id
  policy = file("./iam/policies/iam_cwlogs_for_lambda.json")
}

resource "aws_iam_role" "lambda_exec" {
  name               = "lambda_exec_role"
  assume_role_policy = file("./iam/policies/iam_assume_policy_lambda_exec.json")
  tags               = var.miam_common_tags
}

resource "aws_iam_role" "cloudwatch-api-gtw-role" {
  name               = "api_gateway_cloudwatch_global"
  assume_role_policy = file("./iam/policies/iam_cwlogs_assumerol-apigtw.json")
}

resource "aws_iam_role_policy" "cloudwatch-api-gtw-pol" {
  name   = "default"
  role   = aws_iam_role.cloudwatch-api-gtw-role.id
  policy = file("./iam/policies/iam_cwlogs_policy_api-gtw.json")
}
