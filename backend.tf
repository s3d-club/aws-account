terraform {
  backend "s3" {
    bucket         = "102587820664-tf"
    dynamodb_table = "102587820664-tf"
    key            = "s3d.tfstate"
    region         = "us-east-1"
  }
}
