## IAM user
output "arn" {
  description = "The ARN assigned by AWS for this user."
  value       = "${element(concat(aws_iam_user.user.*.arn, list("")), 0)}"
}

output "name" {
  description = "The user's name."
  value       = "${element(concat(aws_iam_user.user.*.name, list("")), 0)}"
}

output "unique_id" {
  description = "The unique ID assigned by AWS."
  value       = "${element(concat(aws_iam_user.user.*.unique_id, list("")), 0)}"
}

output "path" {
  description = "The unique ID assigned by AWS."
  value       = "${element(concat(aws_iam_user.user.*.path, list("")), 0)}"
}

# output "permissions_boundary" {
#   description = "The unique ID assigned by AWS."
#   value       = "${element(concat(aws_iam_user.user.*.permissions_boundary, list("")), 0)}"
# }

output "force_destroy" {
  description = "The unique ID assigned by AWS."
  value       = "${element(concat(aws_iam_user.user.*.force_destroy, list("")), 0)}"
}

output "policies" {
  description = "list of policies attached to the user"
  value       = "${aws_iam_user_policy_attachment.policies.*.policy_arn}"
}

output "json_policies_id" {
  description = "list of JSON formatted policies to directly attach to the user"
  value       = "${aws_iam_user_policy.json_policies.*.id}"
}

## Access Key
output "access_key_id" {
  description = "The access key ID."
  value       = "${element(concat(aws_iam_access_key.access_key.*.id, list("")), 0)}"
}

output "access_key_encrypted_secret" {
  description = "The encrypted secret, base64 encoded."
  value       = "${element(concat(aws_iam_access_key.access_key.*.encrypted_secret, list("")), 0)}"
}

# output "access_key_secret" {
#   description = "The encrypted secret, base64 encoded."
#   value       = "${local.output_access_key_secret}"
# }

output "access_key_status" {
  description = "\"Active\" or \"Inactive\". Keys are initially active, but can be made inactive by other means."
  value       = "${element(concat(aws_iam_access_key.access_key.*.status, list("")), 0)}"
}

output "access_key_pgp_key" {
  description = "the PGP key used to encrypt the secret"
  value       = "${element(concat(aws_iam_access_key.access_key.*.pgp_key, list("")), 0)}"
}

output "access_key_pgp_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret"
  value       = "${element(concat(aws_iam_access_key.access_key.*.key_fingerprint, list("")), 0)}"
}

output "access_key_ses_smtp_password" {
  description = "The secret access key converted into an SES SMTP password by applying AWS's documented conversion algorithm."
  value       = "${element(concat(aws_iam_access_key.access_key.*.ses_smtp_password, list("")), 0)}"
}

## Login profile
output "login_profile_pgp_key" {
  description = "the PGP key used to encrypt the password"
  value       = "${element(concat(aws_iam_user_login_profile.login_profile.*.pgp_key, list("")), 0)}"
}

output "login_profile_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password. Only available if password was handled on Terraform resource creation, not import."
  value       = "${element(concat(aws_iam_user_login_profile.login_profile.*.key_fingerprint, list("")), 0)}"
}

output "login_profile_encrypted_password" {
  description = "The encrypted console password, base64 encoded."
  value       = "${element(concat(aws_iam_user_login_profile.login_profile.*.encrypted_password, list("")), 0)}"
}

output "login_profile_password_length" {
  description = "The length of the generated password on resource creation. Only applies on resource creation."
  value       = "${element(concat(aws_iam_user_login_profile.login_profile.*.password_length, list("")), 0)}"
}

output "login_profile_password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on resource creation. "
  value       = "${element(concat(aws_iam_user_login_profile.login_profile.*.password_reset_required, list("")), 0)}"
}

## SSH Key
output "ssh_key_public_key" {
  description = "The SSH public key."
  value       = "${element(concat(aws_iam_user_ssh_key.ssh_key.*.public_key, list("")), 0)}"
}

output "ssh_key_ssh_public_key_id" {
  description = "The unique identifier for the SSH public key."
  value       = "${element(concat(aws_iam_user_ssh_key.ssh_key.*.ssh_public_key_id, list("")), 0)}"
}

output "ssh_key_fingerprint" {
  description = "The MD5 message digest of the SSH public key."
  value       = "${element(concat(aws_iam_user_ssh_key.ssh_key.*.fingerprint, list("")), 0)}"
}

output "ssh_key_encoding" {
  description = "The public key encoding format."
  value       = "${element(concat(aws_iam_user_ssh_key.ssh_key.*.encoding, list("")), 0)}"
}

output "ssh_key_status" {
  description = "The status of the SSH public key. "
  value       = "${element(concat(aws_iam_user_ssh_key.ssh_key.*.status, list("")), 0)}"
}
