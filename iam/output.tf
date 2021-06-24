################################################################################
#
#  OUTPUT FOR MODULE FOR IAM
#
################################################################################
output "exp_iam_lambda_role_arn" {
  value = aws_iam_role.lambda_exec.arn
}

# output "exp_iam_lambda_policy_arn" {
#   value = aws_iam_role_policy.lambda_policy.arn
# }

output "exp_iam_cloudwatch-role-api-gtw" {
  value = aws_iam_role.cloudwatch-api-gtw-role.arn
}
