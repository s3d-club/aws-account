module "site" {
  source  = "git::https://github.com/s3d-club/terraform-aws-site.git?ref=0.0.1"

  domain             = "s3d.club"
  key_name           = "s3d"
  disable_s3_content = true
}

module "go_site" {
  source  = "git::https://github.com/s3d-club/terraform-aws-site.git?ref=0.0.1"

  cloudfront = "go"
  domain             = "s3d.club"
  disable_s3_content = true
}

