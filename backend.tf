terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "tooling-betech/terraform.state"
    bucket         = "west-betech-tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-lock-table"
  }
}
