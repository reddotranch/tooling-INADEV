#!/bin/bash

# Function to check AWS region
check_aws_region() {
  local required_region="us-west-2"
  local current_region=$(aws configure get region)

  if [[ "$current_region" != "$required_region" ]]; then
    echo "Error: AWS CLI is not configured for region $required_region."
    echo "Please configure AWS CLI for the correct region and try again."
    exit 1
  fi
}

# Function to ensure script is running in ~/Documents/EKS-PROJECT-INADEV-2025/tooling-INADEV
ensure_correct_directory() {
  local required_directory="/Users/ubuntu/EKS-PROJECT-BETECH-2025/tooling-INADEV"
  if [[ "$PWD" != "$required_directory" ]]; then
    echo "Error: Script must be run from $required_directory."
    echo "Please navigate to $required_directory and try again."
    exit 1
  fi
}

# Function to run Terraform workflow
run_terraform_workflow() {
  echo "Initializing Terraform..."
  if ! terraform init; then
    echo "Terraform init failed. Exiting."
    exit 1
  fi

  echo "Planning Terraform changes..."
  if ! terraform plan; then
    echo "Terraform plan failed. Exiting."
    exit 1
  fi

  echo "Review the Terraform plan output above."
  read -p "Do you want to continue with the apply? (yes/no): " user_choice
  if [[ "$user_choice" != "yes" ]]; then
    echo "User chose to stop. Exiting."
    exit 0
  fi

  echo "Applying Terraform changes..."
  if ! terraform apply --auto-approve; then
    echo "Terraform apply failed. Exiting."
    exit 1
  fi

  echo "Terraform apply completed successfully."
}

# Function to trigger Jenkins job
trigger_jenkins_job() {
  local jenkins_url="https://jenkins1.betechsol.com/job/terraform-pipeline/buildWithParameters"
  local jenkins_token="weatherbackend"
  local jenkins_user="admin"
  local jenkins_password="11869114375ed57d58bf30176361b016d0"
  local crumb="3bc54c6006209d85ae8ce71b1cacc0d5f08036c0209e5539a0ebd41a4c0bbb3d"

  echo "Triggering Jenkins job..."

  # Prompt the user for Deployment_Type and Manual_Approval values
  read -p "Enter the value for 'Deployment_Type' (apply/destroy): " Deployment_Type
  read -p "Enter the value for 'Manual_Approval' (Approve/Reject): " Manual_Approval

  # Validate user input for Deployment_Type
  if [[ ! "$Deployment_Type" =~ ^(apply|destroy)$ ]]; then
    echo "Invalid 'Deployment_Type'. Please enter 'apply' or 'destroy'."
    exit 1
  fi

  # Validate user input for Manual_Approval
  if [[ ! "$Manual_Approval" =~ ^(Approve|Reject)$ ]]; then
    echo "Invalid 'Manual_Approval'. Please enter 'Approve' or 'Reject'."
    exit 1
  fi

  # Trigger the Jenkins job with the provided parameters
  response=$(curl -I -X POST -u "$jenkins_user:$jenkins_password" \
    "$jenkins_url?token=$jenkins_token&Manual_Approval=$Manual_Approval&Deployment_Type=$Deployment_Type" \
    -H "Jenkins-Crumb:$crumb" 2>/dev/null)

  if echo "$response" | grep -q "HTTP/1.1 200"; then
    echo "Jenkins job triggered successfully."
  else
    echo "Failed to trigger Jenkins job. Response: $response"
    exit 1
  fi
}

# Main script execution
check_aws_region
ensure_correct_directory
run_terraform_workflow
trigger_jenkins_job
