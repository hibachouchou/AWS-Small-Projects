resource "aws_s3_bucket" "resume_bucket" {
  bucket = "hiba-cloud-challenge-resume"
  website {
    index_document = "index.html"
  }
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:GetObject",
      Resource  = "arn:aws:s3:::hiba-cloud-challenge-resume/*"
    }]
  })
}
