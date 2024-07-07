resource "aws_dynamodb_table" "cloud_resume-test" {
  name           = "cloud_resume-test"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "N"
  }
}
