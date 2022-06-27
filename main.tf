data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "front_s3_bucket" {
  bucket = var.bucket_name == null ? "front_s3_bucket" : var.bucket_name

  tags = local.tags
}

resource "aws_s3_bucket_public_access_block" "front_s3_bucket_pab" {
  bucket = aws_s3_bucket.front_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "front_s3_bucket_wc" {
  bucket = aws_s3_bucket.front_s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "front_s3_bucket_acl" {
  bucket = aws_s3_bucket.front_s3_bucket.id

  acl = "private"
}

data "aws_iam_policy_document" "front_s3_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.front_s3_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "ccom_customers_front_ci_b2b" {
  bucket = aws_s3_bucket.front_s3_bucket.id
  policy = data.aws_iam_policy_document.front_s3_bucket_policy.json
}



