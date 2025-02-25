resource "aws_iam_role" "code_deploy_demo_ec2_role" {
  name = "CodeDeployDemo-EC2-Instance-Profile"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
