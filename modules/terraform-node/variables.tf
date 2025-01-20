variable "ami_id" {
  description = "The AMI ID for the Jenkins server"
  type        = string
  default     = "ami-0cb91c7de36eed2cb"
}

variable "instance_type" {
  description = "The instance type for the Jenkins server"
  type        = string
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

