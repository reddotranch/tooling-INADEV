output "vpc_cidr" {
  description = "The CIDR block of the tooling-BETECH VPC"
  value       = aws_vpc.tooling_betech_vpc.cidr_block
}

output "vpc_id" {
  value = aws_vpc.tooling_betech_vpc.id
}

output "subnet_id" {
  value = aws_subnet.tooling_betech_subnet.id
}

output "security_group_id" {
  value = aws_security_group.tooling_betech_sg.id
}