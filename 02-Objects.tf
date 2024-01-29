
# dont use this version "aws_s3_bucket_object"

# resource "aws_s3_object" "beach" {
#   bucket = "s3-bucket"
#   key    = "beach.jpg"
#   source = "beach.jpg"


# }

# resource "aws_s3_object" "coffee" {
#   bucket = "s3-bucket"
#   key    = "coffee.jpg"
#   source = "coffee.jpg"


# }


# resource "aws_s3_object" "index" {
#   bucket = "s3-bucket"
#   key    = "index.html"
#   source = "index.html"

# }




# data "aws_s3_objects" "my_objects" {
#   bucket = "s3-bucket"
# }

# data "aws_s3_object" "object_info" {
#   count  = length(data.aws_s3_objects.my_objects.keys)
#   key    = element(data.aws_s3_objects.my_objects.keys, count.index)
#   bucket = data.aws_s3_objects.my_objects.bucket
# }




resource "aws_s3_object" "upload_html" {
  for_each     = fileset("${path.module}/", "*.html")
  bucket       = aws_s3_bucket.s3-bucket.id
  key          = each.value
  source       = "${path.module}/${each.value}"
  etag         = filemd5("${path.module}/${each.value}")
  content_type = "text/html"
}







#https://pfertyk.me/2023/01/creating-a-static-website-with-terraform-and-aws/?fbclid=IwAR381BYntAcSzXw9p8KaURkF4SvDs-pz9gnzPnv4NuUt7mOmWrJ0_rXGqDY

#key          = replace(each.value, "/^content//", "")

resource "aws_s3_object" "upload_pictures_jpg" {
  for_each     = fileset("${path.module}/", "*.jpg")
  bucket       = aws_s3_bucket.s3-bucket.id
  key          = each.value
  source       = "${path.module}/${each.value}"
  etag         = filemd5("${path.module}/${each.value}")
  content_type = "image/jpg"
}

resource "aws_s3_object" "upload_pictures_png" {
  for_each     = fileset("${path.module}/", "*.png")
  bucket       = aws_s3_bucket.s3-bucket.id
  key          = each.value
  source       = "${path.module}/${each.value}"
  etag         = filemd5("${path.module}/${each.value}")
  content_type = "image/png"
}