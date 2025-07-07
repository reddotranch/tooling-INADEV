resource "aws_instance" "sonarqube" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  user_data                   = file("${path.module}/maven_sonarqube.sh")
  tags = {
    Name = "Maven-Sonarqube-Server"
  }
}

resource "aws_eip" "sonarqube_eip" {
  instance = aws_instance.sonarqube.id
  tags = {
    Name = "Maven-Sonarqube-Server"
  }
}