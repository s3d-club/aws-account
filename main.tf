data "aws_vpc" "this" {
  default = true
}

locals {
  group = module.site_group
}

module "go_site" {
  count  = 1
  source = "github.com/s3d-club/terraform-aws-site?ref=v0.1.1"

  cloudfront = "go"
  domain     = local.group.domain
  favicon    = null
  s3_prefix  = local.group.name_prefix
  tags       = local.group.tags
}

module "mark_site" {
  source = "github.com/s3d-club/terraform-aws-site?ref=v0.1.1"

  cloudfront = "mark"
  domain     = local.group.domain
  favicon    = null
  tags       = local.group.tags
  s3_prefix  = local.group.name_prefix
}

module "name" {
  source = "github.com/s3d-club/terraform-external-name?ref=v0.1.1"

  context = "s3d-account"
  path    = path.module
  tags    = {}
}

module "site" {
  source = "github.com/s3d-club/terraform-aws-site?ref=v0.1.1"

  domain    = local.group.domain
  favicon   = null
  tags      = local.group.tags
  s3_prefix = local.group.name_prefix
}

module "site_group" {
  source = "github.com/s3d-club/terraform-aws-site-group?ref=v0.1.1"

  az_blacklist = ["us-east-1e"]
  cidr6s       = ["::/0"]
  cidrs        = ["0.0.0.0/0"]
  domain       = "s3d.club"
  ec2_key_name = var.ec2_key_name
  ecrs         = ["python"]
  enable_ec2   = true
  tags         = module.name.tags
  vpc_id       = data.aws_vpc.this.id
}


provider "kubernetes" {
  config_path = "~/.kube/config"
}
