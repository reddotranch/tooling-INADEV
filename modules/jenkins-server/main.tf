resource "aws_instance" "jenkins_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("${path.module}/jenkins.sh")

  tags = {
    Name = "jenkins-server"
  }
}

# EIP configuration
resource "aws_eip" "jenkins_server_eip" {
  instance = aws_instance.jenkins_server.id
  tags = {
    Name = "jenkins-server"
  }
}
