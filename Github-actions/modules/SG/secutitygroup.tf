#Security Group for module_vpc
resource "aws_security_group" "public_sg" {
  vpc_id                    = var.vpc_id
  name                      = "Public_ec2_security_group"
  description               = "security group that allows all traffic for public instances"
             
  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }

  ingress {
    from_port              = 0
    to_port                = 0
    protocol               = "-1"
    cidr_blocks            = ["0.0.0.0/0"]
  }
  
 tags                      = merge(
                                {
                                  Name        = "public_Security.${var.name}"
                                  Environment = var.environment
                                },
                                var.tags
                                   )

}
  #security_group_for_private/db_instances

resource "aws_security_group" "private_sg" {
  vpc_id                  = var.vpc_id
  name                    = "private_ec2_security_group"
  description             = "security group for private_ec2"

  egress {
    from_port             = 0
    to_port               = 0
    protocol              = "-1"
    cidr_blocks           = ["0.0.0.0/0"]
  }

  ingress {
    from_port             = 0
    to_port               = 0
    protocol              = "-1"
    cidr_blocks           = ["10.0.0.0/16"]
  }
  
 tags                     = merge(
                            {
                              Name        = "private_Security.${var.name}"
                              Environment = var.environment
                            },
                            var.tags
                                 )
}
