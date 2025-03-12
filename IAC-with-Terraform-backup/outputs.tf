output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web_server.public_ip
}
output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.rds_db.endpoint
}
output "aws_s3_bucket" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.storage.bucket
}