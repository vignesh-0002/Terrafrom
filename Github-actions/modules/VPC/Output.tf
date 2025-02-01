output "vpc_id" {
  value = aws_vpc.main.id
}

output "Public_subnet_id" {
  value = aws_subnet.public_sn.id
}

output "Private_subnet_id" {
  value = aws_subnet.private_sn_1.id
}