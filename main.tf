module "jenkins-server" {
 source        = "./modules/jenkins-server"
 ami_id        = var.ami_id
 instance_type = var.instance_type
 key_name      = var.key_name
 main-region   = var.main-region
}

module "terraform-node" {
 source        = "./modules/terraform-node"
 ami_id        = var.ami_id
 instance_type = var.instance_type
 key_name      = var.key_name
 main-region   = var.main-region
}

module "maven-sonarqube-server" {
 source            = "./modules/maven-sonarqube-server"
 ami_id            = var.ami_id
 instance_type     = var.instance_type
 key_name          = var.key_name
 security_group_id = var.security_group_id
 subnet_id         = var.subnet_id
  main-region   = var.main-region
}
