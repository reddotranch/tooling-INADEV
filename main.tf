module "jenkins-server" {
  source            = "./modules/jenkins-server"
#   ami_id            = var.ami_id
#   instance_type     = var.instance_type
#   key_name          = var.key_name
#   main-region       = var.main-region
  vpc_id            = module.vpc.vpc_id
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
}

module "vpc" {
 source = "./modules/vpc"
}

module "maven_sonarqube_server" {
 source            = "./modules/maven-sonarqube-server"
 vpc_id            = module.vpc.vpc_id
 subnet_id         = module.vpc.subnet_id
 security_group_id = module.vpc.security_group_id
}

module "terraform_node" {
 source            = "./modules/terraform-node"
 vpc_id            = module.vpc.vpc_id
 subnet_id         = module.vpc.subnet_id
 security_group_id = module.vpc.security_group_id
}
