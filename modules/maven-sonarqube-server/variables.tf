variable "region" {
  description = "The AWS region to deploy to"
  default     = "us-east-2"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0cb91c7de36eed2cb"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t3.large"
}

variable "key_name" {
  description = "The key name for the Jenkins server"
  type        = string
  default     = "inadev-key"
}

variable "main-region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "security_group_id" {
  description = "The security group ID to attach to the instance"
  type        = string
  default     = "sg-072019c391e521148"
}

variable "subnet_id" {
  description = "The subnet ID where the instance will be deployed"
  type        = string
  default     = "subnet-02dbcffbed6d9f6f4"
}
