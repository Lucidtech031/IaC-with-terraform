variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-2"
}
variable "key_name" {
  default     = "lucidtech-ssh-keypair"
  description = "SSH key pair name"
}
variable "db_username" {
  default     = "lucidtech031"
  description = "RDS database username"
}
variable "db_password" {
  default     = "Cookie91247"
  description = "RDS database password"
}
variable "s3_bucket_name" {
  default     = "lucidtech-storage"
  description = "S3 bucket name"
}