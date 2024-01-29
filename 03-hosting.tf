

resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.s3-bucket.id

  index_document {
    suffix = "index.html"
  }
}