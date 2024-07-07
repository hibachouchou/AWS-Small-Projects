output "bucket_id" {
  description = "The ID of the S3 bucket created for resume"
  value       = module.s3.bucket_id
}

output "website_url" {
  description = "The URL of the CloudFront distribution"
  value       = module.cloudfront.domain_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda.function_arn
}

output "lambda_role_arn" {
  description = "The ARN of the IAM role for Lambda execution"
  value       = module.iam.lambda_role_arn
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.cloudfront.domain_name
}

output "cloudfront_zone_id" {
  description = "The zone ID of the CloudFront distribution"
  value       = module.cloudfront.hosted_zone_id
}
