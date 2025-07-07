# tooling-BETECH

This directory contains infrastructure and DevOps tooling for the BETECH project. It is intended to provide scripts, configuration files, and container images that support development, deployment, and operations workflows.

## Contents

- **Dockerfile**: Defines a custom Docker image for tooling or CI/CD pipelines.
- **nginxbot.tar**: Pre-built Nginx container image or archive for deployment or testing.
- **awscliv2.zip**: AWS CLI v2 installer for managing AWS resources.
- **sonar-scanner-cli-5.0.1.3006-linux.zip**: SonarQube scanner CLI for code quality analysis.
- **application_commands.txt**: Reference or automation commands for application management.
- **pipeline_commands.txt**: Example or template commands for CI/CD pipelines.
- **tf.json**: Terraform state or configuration file for infrastructure as code.

## Usage

1. **Docker Tooling**
   - Build the Docker image:
     ```sh
     docker build -t betech-tooling .
     ```
   - Run the container:
     ```sh
     docker run --rm -it betech-tooling
     ```

2. **AWS CLI**
   - Unzip and install the AWS CLI if needed:
     ```sh
     unzip awscliv2.zip
     sudo ./aws/install
     ```

3. **SonarQube Scanner**
   - Unzip and use the SonarQube scanner for static code analysis:
     ```sh
     unzip sonar-scanner-cli-5.0.1.3006-linux.zip
     ./sonar-scanner-*/bin/sonar-scanner
     ```

4. **Terraform**
   - Use [tf.json](http://_vscodecontentref_/0) with Terraform commands to manage infrastructure state.

5. **Scripts and Commands**
   - Refer to [application_commands.txt](http://_vscodecontentref_/1) and [pipeline_commands.txt](http://_vscodecontentref_/2) for useful commands and automation steps.

## Requirements

- Docker
- AWS CLI (optional, for AWS operations)
- SonarQube (optional, for code analysis)
- Terraform (optional, for infrastructure management)

## License

This directory is part of the BETECH project and follows the main project license.
