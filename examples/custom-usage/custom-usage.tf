# Create a SSH key for the example
resource "tls_private_key" "ssh_alice" {
  algorithm   = "RSA"
}

data "aws_iam_policy_document" "policy_alice" {
  statement {
    sid = "S3"
    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]
    resources = [
      "arn:aws:s3:::*",
    ]
  }
  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::*/home/&{aws:username}",
      "arn:aws:s3:::*/home/&{aws:username}/*",
    ]
  }
}

module "user_alice" {
  source                                = "../../"  
#  source                                = "JousP/iam-user/aws"
#  version                               = "1.0.0"
  name                                  = "alice"
  path                                  = "/users/tech/"
  force_destroy                         = true
  tags                                  = {
    mail                                = "alice@company.com"
  }
  policies                              = ["arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"]
  policies_count                        = 0
  json_policies                         = ["${data.aws_iam_policy_document.policy_alice.json}"]
  json_policies_count                   = 1
  create_access_key                     = true
  access_key_pgp_key                    = "keybase:jous42"
  create_login_profile                  = true
  login_profile_password_reset_required = true
  login_profile_password_length         = 30
  login_profile_pgp_key                 = "keybase:jous42"
  upload_ssh_key                        = true
  ssh_key_encoding                      = "PEM"
  ssh_key_public_key                    = "${tls_private_key.ssh_alice.public_key_pem}"
}

output "alice_arn" {
  description = "The ARN assigned by AWS for this user."
  value       = "${module.user_alice.arn}"
}

output "alice_name" {
  description = "The user's name."
  value       = "${module.user_alice.name}"
}

output "alice_unique_id" {
  description = "The unique ID assigned by AWS."
  value       = "${module.user_alice.unique_id}"
}

output "alice_path" {
  description = "The unique ID assigned by AWS."
  value       = "${module.user_alice.path}"
}

# output "permissions_boundary" {
#   description = "The unique ID assigned by AWS."
#   value       = "${element(concat(aws_iam_user.user.*.permissions_boundary, list("")), 0)}"
# }

output "alice_force_destroy" {
  description = "The unique ID assigned by AWS."
  value       = "${module.user_alice.force_destroy}"
}

output "alice_policies" {
  description = "list of policies attached to the user"
  value       = "${module.user_alice.policies}"
}

output "alice_json_policies_id" {
  description = "list of JSON formatted policies to directly attach to the user"
  value       = "${module.user_alice.json_policies_id}"
}

## Access Key
output "alice_access_key_id" {
  description = "The access key ID."
  value       = "${module.user_alice.access_key_id}"
}

output "alice_access_key_encrypted_secret" {
  description = "The encrypted secret, base64 encoded."
  value       = "${module.user_alice.access_key_encrypted_secret}"
}

# output "alice_access_key_secret" {
#   description = "The encrypted secret, base64 encoded."
#   value       = "${module.user_alice.access_key_secret}"
# }

output "alice_access_key_status" {
  description = "\"Active\" or \"Inactive\". Keys are initially active, but can be made inactive by other means."
  value       = "${module.user_alice.access_key_status}"
}

output "alice_access_key_pgp_key" {
  description = "the PGP key used to encrypt the secret"
  value       = "${module.user_alice.access_key_pgp_key}"
}

output "alice_access_key_pgp_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret"
  value       = "${module.user_alice.access_key_pgp_key_fingerprint}"
}

output "alice_access_key_ses_smtp_password" {
  description = "The secret access key converted into an SES SMTP password by applying AWS's documented conversion algorithm."
  value       = "${module.user_alice.access_key_ses_smtp_password}"
}

## Login profile
output "alice_login_profile_pgp_key" {
  description = "the PGP key used to encrypt the password"
  value       = "${module.user_alice.login_profile_pgp_key}"
}

output "alice_login_profile_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password. Only available if password was handled on Terraform resource creation, not import."
  value       = "${module.user_alice.login_profile_key_fingerprint}"
}

output "alice_login_profile_encrypted_password" {
  description = "The encrypted console password, base64 encoded."
  value       = "${module.user_alice.login_profile_encrypted_password}"
}

output "alice_login_profile_password_length" {
  description = "The length of the generated password on resource creation. Only applies on resource creation."
  value       = "${module.user_alice.login_profile_password_length}"
}

output "alice_login_profile_password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on resource creation. "
  value       = "${module.user_alice.login_profile_password_reset_required}"
}

## SSH Key
output "alice_ssh_key_public_key" {
  description = "The SSH public key."
  value       = "${module.user_alice.ssh_key_public_key}"
}

output "alice_ssh_key_ssh_public_key_id" {
  description = "The unique identifier for the SSH public key."
  value       = "${module.user_alice.ssh_key_ssh_public_key_id}"
}

output "alice_ssh_key_fingerprint" {
  description = "The MD5 message digest of the SSH public key."
  value       = "${module.user_alice.ssh_key_fingerprint}"
}

output "alice_ssh_key_encoding" {
  description = "The public key encoding format."
  value       = "${module.user_alice.ssh_key_encoding}"
}

output "alice_ssh_key_status" {
  description = "The status of the SSH public key. "
  value       = "${module.user_alice.ssh_key_status}"
}

