## IAM user
output "path" {
  description = "Path of the user."
  value       = aws_iam_user.user.path
}

output "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user."
  value       = aws_iam_user.user.permissions_boundary
}

output "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  value       = aws_iam_user.user.force_destroy
}

output "tags" {
  description = "Key-value map of tags for the IAM user."
  value       = aws_iam_user.user.tags
}

output "arn" {
  description = "The ARN assigned by AWS for this user."
  value       = aws_iam_user.user.arn
}

output "name" {
  description = "The user's name."
  value       = aws_iam_user.user.name
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_iam_user.user.tags_all
}

output "unique_id" {
  description = "The unique ID assigned by AWS."
  value       = aws_iam_user.user.unique_id
}

## Policies
output "policies" {
  description = "list of policies attached to the user"
  value       = aws_iam_user_policy_attachment.policies.*.policy_arn
}

output "json_policies_id" {
  description = "list of JSON formatted policies to directly attach to the user"
  value       = aws_iam_user_policy.json_policies.*.id
}

## Access Key
output "access_key_pgp_key" {
  description = "(Optional) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists, for use in the encrypted_secret output attribute."
  value       = element(concat(aws_iam_access_key.access_key.*.pgp_key, [""]), 0)
}

output "access_key_status" {
  description = "(Optional) The access key status to apply. Defaults to Active. Valid values are Active and Inactive."
  value       = element(concat(aws_iam_access_key.access_key.*.status, [""]), 0)
}

output "access_key_create_date" {
  description = "Date and time in RFC3339 format that the access key was created."
  value       = element(concat(aws_iam_access_key.access_key.*.create_date, [""]), 0)
}

output "access_key_id" {
  description = "The access key ID."
  value       = element(concat(aws_iam_access_key.access_key.*.id, [""]), 0)
}

output "access_key_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret. This attribute is not available for imported resources."
  value       = element(concat(aws_iam_access_key.access_key.*.key_fingerprint, [""]), 0)
}

output "access_key_secret" {
  description = "The secret access key. This attribute is not available for imported resources. Note that this will be written to the state file. If you use this, please protect your backend state file judiciously. Alternatively, you may supply a pgp_key instead, which will prevent the secret from being stored in plaintext, at the cost of preventing the use of the secret key in automation."
  value       = element(concat(aws_iam_access_key.access_key.*.secret, [""]), 0)
}

output "access_key_encrypted_secret" {
  description = "The encrypted secret, base64 encoded, if pgp_key was specified. This attribute is not available for imported resources. The encrypted secret may be decrypted using the command line, for example: terraform output -raw encrypted_secret | base64 --decode | keybase pgp decrypt."
  value       = element(concat(aws_iam_access_key.access_key.*.encrypted_secret, [""]), 0)
}

output "access_key_ses_smtp_password_v4" {
  description = "The secret access key converted into an SES SMTP password by applying AWS's documented Sigv4 conversion algorithm. This attribute is not available for imported resources. As SigV4 is region specific, valid Provider regions are ap-south-1, ap-southeast-2, eu-central-1, eu-west-1, us-east-1 and us-west-2. See current AWS SES regions."
  value       = element(concat(aws_iam_access_key.access_key.*.ses_smtp_password_v4, [""]), 0)
}


## Login profile
output "login_profile_pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Only applies on resource creation. Drift detection is not possible with this argument."
  value       = element(concat(aws_iam_user_login_profile.login_profile.*.pgp_key, [""]), 0)
}

output "login_profile_password_length" {
  description = "The length of the generated password on resource creation."
  value       = element(concat(aws_iam_user_login_profile.login_profile.*.password_length, [""]), 0)
}

output "login_profile_password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on resource creation."
  value       = element(concat(aws_iam_user_login_profile.login_profile.*.password_reset_required, [""]), 0)
}

output "login_profile_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password. Only available if password was handled on Terraform resource creation, not import."
  value       = element(concat(aws_iam_user_login_profile.login_profile.*.key_fingerprint, [""]), 0)
}

output "login_profile_encrypted_password" {
  description = "The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import."
  value       = element(concat(aws_iam_user_login_profile.login_profile.*.encrypted_password, [""]), 0)
}


## SSH Key
output "ssh_key_encoding" {
  description = "Specifies the public key encoding format."
  value       = element(concat(aws_iam_user_ssh_key.ssh_key.*.encoding, [""]), 0)
}

output "ssh_key_public_key" {
  description = "The SSH public key."
  value       = element(concat(aws_iam_user_ssh_key.ssh_key.*.public_key, [""]), 0)
}

output "ssh_key_status" {
  description = "The status of the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used."
  value       = element(concat(aws_iam_user_ssh_key.ssh_key.*.status, [""]), 0)
}

output "ssh_key_ssh_public_key_id" {
  description = "The unique identifier for the SSH public key."
  value       = element(concat(aws_iam_user_ssh_key.ssh_key.*.ssh_public_key_id, [""]), 0)
}

output "ssh_key_fingerprint" {
  description = "The MD5 message digest of the SSH public key."
  value       = element(concat(aws_iam_user_ssh_key.ssh_key.*.fingerprint, [""]), 0)
}
