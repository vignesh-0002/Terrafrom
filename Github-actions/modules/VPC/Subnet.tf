#public_subnet
resource "aws_subnet" "public_sn" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.Public_sn_cidr
  availability_zone       = var.public_subnet_az

    tags = merge(
    {
      Name        = "public_subnet.${var.name}"
      Environment = var.environment
    },
    var.tags
  )
}

#private_subnet

resource "aws_subnet" "private_sn_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.Private_sn_cidr_1
  availability_zone       = var.public_subnet_az
  tags                    = merge(
                                 {
                                   Name        = "private_subnet_1.${var.name}"
                                   Environment = var.environment
                                 },
                                 var.tags
                                 )
}


