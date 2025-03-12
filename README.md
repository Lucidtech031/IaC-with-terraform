Infrastructure as Code with Terraform 🚀
Overview:

This project automates cloud infrastructure deployment using Terraform. It provisions AWS resources such as:
*VPC
*Subnets
*Security Groups
*EC2 Instances
*RDS Databases
*S3 Buckets and Terraform State Storage
*Github Actions for CI/CD Automation

Project Architecture 🏗️

    +--------------------+
    |  Developer (You)   |
    +--------------------+
             |
             v
    +---------------------+
    |  GitHub Repository  |
    +---------------------+
             |
             v
    +----------------------+
    |  GitHub Actions CI/CD |
    +----------------------+
             |
             v
    +--------------------+         +--------------------+
    |  Terraform Backend | ----->  |  AWS S3 (State)    |
    +--------------------+         +--------------------+
             |                            |
             v                            v
    +--------------------+         +--------------------+
    | AWS Infrastructure | ----->  | DynamoDB (Locking) |
    +--------------------+         +--------------------+
             |
             v
    +--------------------+
    | EC2 / RDS / VPC   |
    +--------------------+
Prerequisites ⚙️

Make sure you have the following installed: 
*Terraform(>= 1.x)
*AWS CLI (>= 2.x)
*Git
*An AWS account with appropriate permissions

Setup Instructions
```bash
git clone https://github.com/Lucidtech031/IAC-with-Terraform.git
cd IAC-with-Terraform
```
Configure AWS Credentials
```bash
aws configure
```
Initialize Terraform
```bash
terraform init
```
Plan and Apply Infrastructure
```bash
terraform plan
terraform apply -auto-approve
```
Destroy Resources (if needed)
```bash
terraform destroy -auto-approve
```
GitHub Actions CI/CD
This project uses GitHub Actions for automated Terraform deployments. The workflow file is located in:
```bash
.github/workflows/terraform.yml
```
make sure to store AWS credentials in GitHub Secrets.

Contributing

Feel free to submit issues or open pull requests!

License

This project is licensed under the MIT license.
