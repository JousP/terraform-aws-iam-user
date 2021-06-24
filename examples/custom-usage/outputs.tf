output "user_alice_path" {
  value = module.user_alice.path
}

output "user_alice_permissions_boundary" {
  value = module.user_alice.permissions_boundary
}

output "user_alice_force_destroy" {
  value = module.user_alice.force_destroy
}

output "user_alice_tags" {
  value = module.user_alice.tags
}

output "user_alice_arn" {
  value = module.user_alice.arn
}

output "user_alice_name" {
  value = module.user_alice.name
}

output "user_alice_tags_all" {
  value = module.user_alice.tags_all
}

output "user_alice_unique_id" {
  value = module.user_alice.unique_id
}

output "user_alice_policies" {
  value = module.user_alice.policies
}

output "user_alice_json_policies_id" {
  value = module.user_alice.json_policies_id
}

output "user_alice_access_key_pgp_key" {
  value = module.user_alice.access_key_pgp_key
}

output "user_alice_access_key_status" {
  value = module.user_alice.access_key_status
}

output "user_alice_access_key_create_date" {
  value = module.user_alice.access_key_create_date
}

output "user_alice_access_key_id" {
  value = module.user_alice.access_key_id
}

output "user_alice_access_key_key_fingerprint" {
  value = module.user_alice.access_key_key_fingerprint
}

output "user_alice_access_key_secret" {
  value     = module.user_alice.access_key_secret
  sensitive = true
}

output "user_alice_access_key_encrypted_secret" {
  value = module.user_alice.access_key_encrypted_secret
}

output "user_alice_access_key_ses_smtp_password_v4" {
  value     = module.user_alice.access_key_ses_smtp_password_v4
  sensitive = true
}

output "user_alice_login_profile_pgp_key" {
  value = module.user_alice.login_profile_pgp_key
}

output "user_alice_login_profile_password_length" {
  value = module.user_alice.login_profile_password_length
}

output "user_alice_login_profile_password_reset_required" {
  value = module.user_alice.login_profile_password_reset_required
}

output "user_alice_login_profile_key_fingerprint" {
  value = module.user_alice.login_profile_key_fingerprint
}

output "user_alice_login_profile_encrypted_password" {
  value = module.user_alice.login_profile_encrypted_password
}

output "user_alice_ssh_key_encoding" {
  value = module.user_alice.ssh_key_encoding
}

output "user_alice_ssh_key_public_key" {
  value = module.user_alice.ssh_key_public_key
}

output "user_alice_ssh_key_status" {
  value = module.user_alice.ssh_key_status
}

output "user_alice_ssh_key_ssh_public_key_id" {
  value = module.user_alice.ssh_key_ssh_public_key_id
}

output "user_alice_ssh_key_fingerprint" {
  value = module.user_alice.ssh_key_fingerprint
}

