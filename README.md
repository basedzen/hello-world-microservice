This project demonstrates the deployment of a containerised Python microservice using AWS ECS (Elastic Container Service) and Fargate. It showcases Infrastructure as Code (IaC) using Terraform, integrated with a CI/CD pipeline via GitHub Actions.
The project highlights best practices in cloud engineering, including testing during deployments, security in code, and scalable infrastructure.

# Features
* Microservice: A lightweight Python Flask app returning a "Hello, World!" response.
* Containerisation: Dockerised microservice for portability and consistency.
* Infrastructure as Code: Fully automated infrastructure provisioning with Terraform.
* CI/CD Pipeline:
* Automated deployments using GitHub Actions.
* Security and quality checks using tools like SonarQube.
* Scalability: Utilises AWS ECS Fargate to scale seamlessly.
* Testing: Includes unit testing, integration testing, and security validation.

# Project Architecture
### Microservice:
A Python Flask app exposing a simple HTTP endpoint: /.
Containerised with Docker.
### Infrastructure:
* AWS ECR: Stores Docker images.
* AWS ECS: Hosts the containerised microservice.
* AWS Fargate: Runs containers without managing servers.
* Networking:
* VPC with public subnets and security groups to allow HTTP traffic.
## CI/CD Pipeline:
### GitHub Actions
* Automates Docker builds and pushes to AWS ECR.
* Runs Terraform commands (init, validate, plan, apply) to deploy infrastructure.
### Testing:
* Automated tests integrated into the pipeline.
* Static code analysis for security vulnerabilities.
# Setup and Deployment
## Prerequisites
* Docker installed locally.
* AWS CLI configured with appropriate IAM permissions.
* Terraform installed and configured.
* GitHub repository with GitHub Actions enabled.
### Steps to Deploy
#### Clone the Repository:
git clone https://github.com/basedzen/hello-world-microservice.git
cd hello-world-microservice
#### Build and Test the Docker Image:
docker build -t hello-world-microservice .
docker run -p 5000:5000 hello-world-microservice
curl http://localhost:5000
### Push the Docker Image to AWS ECR:
#### Authenticate Docker with ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-east-1.amazonaws.com
#### Tag and push the image:
docker tag hello-world-microservice:latest <account-id>.dkr.ecr.us-east-1.amazonaws.com/hello-world-microservice:latest
docker push <account-id>.dkr.ecr.us-east-1.amazonaws.com/hello-world-microservice:latest
#### Deploy Infrastructure Using Terraform:
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
### CI/CD Pipeline:
Push changes to the main branch to trigger the GitHub Actions workflow.
# Endpoints
Base URL: http://<ECS-Service-Endpoint>
Available Route:
GET /: Returns Hello, World!
# Testing
## Unit Tests:
* Tests application logic with the Flask testing client.
* Run locally using:
pytest
## Integration Tests:
* Validates that the application is functional once deployed.
## Security Testing:
* Uses SonarQube in the CI/CD pipeline to identify vulnerabilities and code smells.
# Common Issues and Fixes
### Docker Push Fails with 404:
Ensure the ECR repository exists in AWS:
aws ecr create-repository --repository-name hello-world-microservice
### Terraform Deployment Fails:
Validate configuration with:
* terraform validate
### CI/CD Pipeline Errors:
* Check GitHub Actions logs for specific errors.
* Fix issues related to permissions or syntax.
# Technologies Used
* Programming Language: Python (Flask).
* Containerisation: Docker.
* Cloud Provider: AWS (ECS, ECR, Fargate, VPC).
* Infrastructure as Code: Terraform.
* CI/CD: GitHub Actions.
* Testing and Security: SonarQube, pytest