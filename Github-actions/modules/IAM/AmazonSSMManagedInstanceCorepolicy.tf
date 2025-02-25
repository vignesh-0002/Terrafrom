resource "aws_iam_policy_attachment" "ssm_policy_attachment" {
  name       = "CodeDeployDemo-EC2-SSM-Policy-Attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  roles      = [aws_iam_role.code_deploy_demo_ec2_role.name]
}
