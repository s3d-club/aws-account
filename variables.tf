variable "ec2_key_name" {
  default = null
  type    = string

  description = <<-END
    EC2 Key Name

    The ec2 key name or null if an EC2 instance is not desired.
    END
}
