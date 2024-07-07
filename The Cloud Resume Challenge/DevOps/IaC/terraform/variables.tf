variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "role_arn" {
  description = "The ARN of the IAM role for Lambda execution"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for the static website"
  type        = string
  default     = "hiba-cloud-challenge-resume"
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_zone_id" {
  description = "The zone ID of the CloudFront distribution"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}
