provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "terraform/state/terraform.tfstate"
    region = var.aws_region
  }
}

module "s3" {
  source = "./s3"
}

module "cloudfront" {
  source    = "./cloudfront"
  s3_bucket = module.s3.bucket_id
}

module "route53" {
  source                 = "./route53"
  cloudfront_domain_name = module.cloudfront.domain_name
  cloudfront_zone_id     = module.cloudfront.hosted_zone_id
}

module "dynamodb" {
  source = "./dynamodb"
}

module "iam" {
  source = "./iam"
}

module "lambda" {
  source  = "./lambda"
  role_arn = module.iam.lambda_role_arn
}

module "api_gateway" {
  source              = "./api_gateway"
  lambda_function_arn = module.lambda.function_arn
}
