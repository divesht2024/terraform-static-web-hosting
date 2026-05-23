terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }
}


provider "aws" {
  region = var.region
}

// random provider
resource "random_id" "rand_id" {
  byte_length = 5
}


// s3-bucket-creation
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bkt-${random_id.rand_id.hex}"
}
 
// Object upload
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.my_bucket.bucket
  source = "./index.html"
  key = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.my_bucket.bucket
  source = "./style.css"
  key = "style.css"
  content_type = "text/css"
}


// Block Public Access (disable)
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

// Bucket Policy
resource "aws_s3_bucket_policy" "my_app" {
  bucket = aws_s3_bucket.my_bucket.bucket
  policy = jsonencode({
    Version: "2012-10-17",
    Statement = [
        {
            Sid= "PublicReadGetObject",
            Effect= "Allow",
            Principal= "*",
            Action= "s3:GetObject",
            Resource= "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*"
        }
            ]
}

)
}

// Website-Configuration
resource "aws_s3_bucket_website_configuration" "app" {
  bucket = aws_s3_bucket.my_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}

// Output
output "name" {
  value=aws_s3_bucket_website_configuration.app.website_endpoint
}
