module "user_bob" {
  source  = "JousP/iam-user/aws"
  version = "2.0.0"
  name    = "bob"
}

output "bob_arn" {
  description = "The ARN assigned by AWS for this user."
  value       = module.user_bob.arn
}

output "bob_name" {
  description = "The user's name."
  value       = module.user_bob.name
}

output "bob_unique_id" {
  description = "The unique ID assigned by AWS."
  value       = module.user_bob.unique_id
}

output "bob_path" {
  description = "The unique ID assigned by AWS."
  value       = module.user_bob.path
}

output "bob_permissions_boundary" {
  description = "The unique ID assigned by AWS."
  value       = module.user_bob.permissions_boundary
}

output "bob_force_destroy" {
  description = "The unique ID assigned by AWS."
  value       = module.user_bob.force_destroy
}

output "bob_policies" {
  description = "list of policies attached to the user"
  value       = module.user_bob.policies
}

output "bob_json_policies_id" {
  description = "list of JSON formatted policies to directly attach to the user"
  value       = module.user_bob.json_policies_id
}

## Access Key
output "bob_access_key_id" {
  description = "The access key ID."
  value       = module.user_bob.access_key_id
}

output "bob_access_key_encrypted_secret" {
  description = "The encrypted secret, base64 encoded."
  value       = module.user_bob.access_key_encrypted_secret
}

output "bob_access_key_secret" {
  description = "The secret access key."
  value       = module.user_bob.access_key_secret
}

output "bob_access_key_status" {
  description = "\"Active\" or \"Inactive\". Keys are initially active, but can be made inactive by other means."
  value       = module.user_bob.access_key_status
}

output "bob_access_key_pgp_key" {
  description = "the PGP key used to encrypt the secret"
  value       = module.user_bob.access_key_pgp_key
}

output "bob_access_key_pgp_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret"
  value       = module.user_bob.access_key_pgp_key_fingerprint
}

output "bob_access_key_ses_smtp_password" {
  description = "The secret access key converted into an SES SMTP password by applying AWS's documented conversion algorithm."
  value       = module.user_bob.access_key_ses_smtp_password
}

## Login profile
output "bob_login_profile_pgp_key" {
  description = "the PGP key used to encrypt the password"
  value       = module.user_bob.login_profile_pgp_key
}

output "bob_login_profile_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password. Only available if password was handled on Terraform resource creation, not import."
  value       = module.user_bob.login_profile_key_fingerprint
}

output "bob_login_profile_encrypted_password" {
  description = "The encrypted console password, base64 encoded."
  value       = module.user_bob.login_profile_encrypted_password
}

output "bob_login_profile_password_length" {
  description = "The length of the generated password on resource creation. Only applies on resource creation."
  value       = module.user_bob.login_profile_password_length
}

output "bob_login_profile_password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on resource creation. "
  value       = module.user_bob.login_profile_password_reset_required
}

## SSH Key
output "bob_ssh_key_public_key" {
  description = "The SSH public key."
  value       = module.user_bob.ssh_key_public_key
}

output "bob_ssh_key_ssh_public_key_id" {
  description = "The unique identifier for the SSH public key."
  value       = module.user_bob.ssh_key_ssh_public_key_id
}

output "bob_ssh_key_fingerprint" {
  description = "The MD5 message digest of the SSH public key."
  value       = module.user_bob.ssh_key_fingerprint
}

output "bob_ssh_key_encoding" {
  description = "The public key encoding format."
  value       = module.user_bob.ssh_key_encoding
}

output "bob_ssh_key_status" {
  description = "The status of the SSH public key. "
  value       = module.user_bob.ssh_key_status
}

