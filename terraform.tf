provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">=1.3.6"

  required_providers {
    aws      = ">=4.45.0"
    external = ">=2.2.3"
    random   = ">=3.4.3"
    time     = ">=0.9.1"
  }
}
