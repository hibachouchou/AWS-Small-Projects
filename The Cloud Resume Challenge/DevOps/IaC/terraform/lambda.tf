resource "aws_lambda_function" "cloudresume-api" {
  function_name = "cloudresume-api"
  role          = var.role_arn
  handler       = "index.handler"
  runtime       = "nodejs20.x"

  code {
    zip_file = <<-ZIP
      # Paste your base64-encoded ZIP file content here
      YOUR_BASE64_ENCODED_ZIP_FILE_CONTENT
    ZIP
  }
}
