# Create a SSH key for the example
resource "tls_private_key" "ssh_alice" {
  algorithm = "RSA"
}

data "aws_iam_policy_document" "policy_alice" {
  statement {
    sid       = "S3"
    actions   = ["s3:ListAllMyBuckets", "s3:GetBucketLocation"]
    resources = ["arn:aws:s3:::*"]
  }
  statement {
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::*/home/&{aws:username}",
      "arn:aws:s3:::*/home/&{aws:username}/*",
    ]
  }
}

module "user_alice" {
  source                                = "JousP/iam-user/aws"
  version                               = "~> 3.1"
  name                                  = "alice"
  path                                  = "/users/tech/"
  force_destroy                         = true
  policies                              = ["arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"]
  policies_count                        = 0
  json_policies                         = [data.aws_iam_policy_document.policy_alice.json]
  json_policies_count                   = 1
  create_access_key                     = true
  access_key_pgp_key                    = "keybase:jous42"
  create_login_profile                  = true
  login_profile_password_reset_required = true
  login_profile_password_length         = 30
  login_profile_pgp_key                 = "keybase:jous42"
  upload_ssh_key                        = true
  ssh_key_encoding                      = "PEM"
  ssh_key_public_key                    = tls_private_key.ssh_alice.public_key_pem
  tags = {
    mail = "alice@company.com"
  }
}

