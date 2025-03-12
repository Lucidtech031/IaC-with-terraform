provider "aws" {
  region = "us-east-2"
}
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/24"
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "web_server" {
  ami                    = "ami-0d0f28110d16ee7d6"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-000089702c91f8d25"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "Terraform-WebServer"
  }
}
resource "aws_db_instance" "rds_db" {
  allocated_storage   = 10
  storage_type        = "gp2"
  engine              = "postgres"
  engine_version      = "15.10"
  instance_class      = "db.t3.micro"
  identifier          = "terraform-rds-db"
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = true
  skip_final_snapshot = true
}
resource "aws_s3_bucket" "storage" {
  bucket = var.s3_bucket_name
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "lucidtech-terraform-state"
  acl = "private"
}
resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform_lock"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}
terraform {
  backend "s3" {
    bucket = "lucidtech-storage"
    key = "terraform.tfstate"
    region = "us-east-2"
    encrypt = true
    use_lockfile = true
    acl = "private"
  }
}