resource "aws_iam_policy" "code_deploy_demo_ec2_permissions" {
  name        = "CodeDeployDemo-EC2-Permissions"
  description = "Policy to allow EC2 instances to interact with S3 for CodeDeploy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:Get*",
          "s3:List*"
        ]
        Resource = "*"
      }
    ]
  })
}
