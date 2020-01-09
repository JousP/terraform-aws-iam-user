variable "name" {
  description = "(Required) The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. User names are not distinguished by case. For example, you cannot create users named both 'TESTUSER' and 'testuser'."
  type        = string
}

variable "path" {
  description = "(Optional) Path in which to create the user."
  type        = string
  default     = null
}

variable "permissions_boundary" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the user."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "(Optional, default false) When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Optional) Key-value mapping of tags for the IAM user"
  type        = map(string)
  default     = {}
}

## User's IAM policies
variable "policies_count" {
  description = "Number of policies ARN provided"
  type        = number
  default     = 0
}

variable "policies" {
  description = "The ARNs of policies to directly attach to the user"
  type        = list(string)
  default     = [""]
}

variable "json_policies_count" {
  description = "Number of JSON policy provided"
  type        = number
  default     = 0
}

variable "json_policies" {
  description = "list of JSON formatted policies to directly attach to the user"
  type        = list(string)
  default     = [""]
}

## Access keys
variable "create_access_key" {
  description = "(Optional) Whether to create access key for the user."
  type        = bool
  default     = false
}

variable "access_key_pgp_key" {
  description = "(Optional) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists, for use in the encrypted_secret output attribute."
  type        = string
  default     = null
}

variable "access_key_status" {
  description = "(Optional) The access key status to apply. Defaults to Active. Valid values are Active and Inactive."
  type        = string
  default     = null
}

## Login Profile
variable "create_login_profile" {
  description = "(Optional) Whether to create a Login profile for console"
  type        = bool
  default     = false
}

variable "login_profile_password_reset_required" {
  description = "(Required) Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = null
}

variable "login_profile_pgp_key" {
  description = "(Required) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username."
  type        = string
  default     = null
}

variable "login_profile_password_length" {
  description = "(Optional) The length of the generated password."
  type        = number
  default     = null
}

## SSH Key Upload
variable "upload_ssh_key" {
  description = "(Optional) Whether to upload an SSH key for the user."
  type        = bool
  default     = false
}

variable "ssh_key_public_key" {
  description = "(Required) The SSH public key. The public key must be encoded in ssh-rsa format or PEM format."
  type        = string
  default     = null
}

variable "ssh_key_encoding" {
  description = "(Optional) Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM."
  type        = string
  default     = null
}

variable "ssh_key_status" {
  description = "(Optional) The status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used."
  type        = string
  default     = null
}

# Avoid resources creation
variable "enabled" {
  description = "(Optional) Whether resources have to be deployed"
  type        = bool
  default     = true
}

