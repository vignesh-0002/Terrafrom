#resource "tls_private_key" "this" {
#  algorithm     = "RSA"
#  rsa_bits      = 4096
#}
#
#resource "aws_key_pair" "this" {
#  key_name      = var.keypair-name // terraform.workspace
#  public_key    = tls_private_key.this.public_key_openssh
#
#  provisioner "local-exec" {
#    command = <<-EOT
#      echo "${tls_private_key.this.private_key_pem}" > "${var.keypair-name}".pem
#    EOT
#  }
#}
#










resource "tls_private_key" "this" {
  algorithm     = "RSA"
  rsa_bits      = 4096
}

resource "aws_key_pair" "this" {
  key_name      = var.keypair-name // terraform.workspace
  public_key    = tls_private_key.this.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.this.private_key_pem}" > "${var.keypair-name}".pem
    EOT
  }
}












resource "aws_instance" "FE_instance_module" {
  ami                         =  var.ami_fe
  instance_type               =  var.instance_type
  key_name                    =  aws_key_pair.this.key_name
  subnet_id                   =  var.Public_subnet_id
  security_groups             = [var.public_sg]
  associate_public_ip_address =  var.associate_public_ip_address
  tags                        =  merge(
                                   {
                                     Name        = "FE.${var.name}"
                                     Environment = var.environment
                                   },
                                   var.tags
                                     )

}

#private_ec2

resource "aws_instance" "BE_instance_module" {
  ami                              = var.ami_be
  instance_type                    = var.instance_type
  key_name                         = aws_key_pair.this.key_name
  subnet_id                        = var.Public_subnet_id
  iam_instance_profile             = "${var.ec2_instance_profile}"
  security_groups                  = [var.public_sg] 
  associate_public_ip_address      = var.associate_public_ip_address
  tags                             = merge(
                                        {
                                          Name        = "BE_ec2.${var.name}"
                                          Environment = var.environment
                                        },
                                        var.tags
                                          )

}



#private_ec2

resource "aws_instance" "DB_instance_module" {
  ami                              = var.ami_mysql
  instance_type                    = var.instance_type
  key_name                         = aws_key_pair.this.key_name
  subnet_id                        = var.Private_subnet_id
  iam_instance_profile             = "${var.ec2_instance_profile}"
  security_groups                  = [var.private_sg] 
  associate_public_ip_address      = false
  tags                             = merge(
                                        {
                                          Name        = "Mysql_ec2.${var.name}"
                                          Environment = var.environment
                                        },
                                        var.tags
                                          )

}
