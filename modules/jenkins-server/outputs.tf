
output "jenkins_server_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "jenkins_server_inst_id" {
  value = aws_instance.jenkins_server.id
}
