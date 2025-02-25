resource "aws_iam_instance_profile" "code_deploy_demo_ec2_instance_profile" {
  name = "CodeDeployDemo-EC2-Instance-Profile"
  role = aws_iam_role.code_deploy_demo_ec2_role.name
}
