# tooling-BETECH VPC and networking resources
resource "aws_vpc" "tooling_betech_vpc" {
  cidr_block           = "10.20.0.0/16"   # <-- Add this line
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tooling-BETECH-vpc"
  }
}

resource "aws_subnet" "tooling_betech_subnet" {
  vpc_id                  = aws_vpc.tooling_betech_vpc.id
  cidr_block              = "10.20.1.0/24"         # <-- Add this line
  map_public_ip_on_launch = true

  tags = {
    Name = "tooling-BETECH-subnet"
  }
}

resource "aws_security_group" "tooling_betech_sg" {
  name        = "tooling_betech_sg"
  description = "Security group for tooling-BETECH resources"
  vpc_id = aws_vpc.tooling_betech_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 465
    to_port     = 465
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = {
    Name = "tooling-BETECH-sg"
  }
}

resource "aws_internet_gateway" "tooling_betech_igw" {
  vpc_id = aws_vpc.tooling_betech_vpc.id

  tags = {
    Name = "tooling-BETECH-igw"
  }
}

resource "aws_route_table" "tooling_betech_public_rt" {
  vpc_id = aws_vpc.tooling_betech_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tooling_betech_igw.id
  }

  tags = {
    Name = "tooling-BETECH-public-rt"
  }
}

resource "aws_route_table_association" "tooling_betech_subnet_assoc" {
  subnet_id      = aws_subnet.tooling_betech_subnet.id
  route_table_id = aws_route_table.tooling_betech_public_rt.id
}