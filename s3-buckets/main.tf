provider "aws" {
  region = "us-east-1"
}

# توليد لاحقة عشوائية
resource "random_id" "suffix1" {
  byte_length = 4
}

resource "random_id" "suffix2" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "imane-eks-bucket1-${random_id.suffix1.hex}"

  tags = {
    Name        = "imane-eks-bucket1-${random_id.suffix1.hex}"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket1_versioning" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "imane-eks-bucket2-${random_id.suffix2.hex}"

  tags = {
    Name        = "imane-eks-bucket2-${random_id.suffix2.hex}"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket2_versioning" {
  bucket = aws_s3_bucket.bucket2.id
  versioning_configuration {
    status = "Enabled"
  }
}
