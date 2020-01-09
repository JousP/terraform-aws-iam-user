# Define required variables for additional resources
locals {
  requirement_login_profile = "${var.login_profile_password_reset_required != "" && var.login_profile_pgp_key != "" ? true : false}"
  requirement_access_key    = "${var.access_key_pgp_key != "" ? true : false}"
#  requirement_ssh_key       = "${var.ssh_key_public_key != "" ? true : false}"
}

# Create an IAM user
resource "aws_iam_user" "user" {
  count                = "${var.enabled}"
  name                 = "${var.name}"
  path                 = "${var.path}"
  permissions_boundary = "${var.permissions_boundary}"
  force_destroy        = "${var.force_destroy}"
  tags                 = "${var.tags}"
}

# Attach the Managed Policies to the user
resource "aws_iam_user_policy_attachment" "policies" {
  count      = "${var.enabled ? var.policies_count : 0}"
  user       = "${aws_iam_user.user.name}"
  policy_arn = "${element(var.policies, count.index)}"
  depends_on = ["aws_iam_user.user"]
}

# Attach the In-line Policies to the user
resource "aws_iam_user_policy" "json_policies" {
  count      = "${var.enabled ? var.json_policies_count : 0}"
  name       = "${var.name}-${count.index}"
  policy     = "${element(var.json_policies, count.index)}"
  user       = "${aws_iam_user.user.name}"
  depends_on = ["aws_iam_user.user"]
}

# Create an Access Key for the user
resource "null_resource" "access_key" {
  count = "${!var.enabled || !var.create_access_key || local.requirement_access_key ? 0 : 1}"
  "ERROR: When you set create_access_key to true, you must also provide an access_key_pgp_key (string)" = true
}

resource "aws_iam_access_key" "access_key" {
  count      = "${var.enabled && var.create_access_key ? 1 : 0}"
  user       = "${aws_iam_user.user.name}"
  pgp_key    = "${var.access_key_pgp_key}"
  status     = "${var.access_key_status}"
  depends_on = ["aws_iam_user.user"]
}

# Create a Login profile for console
resource "null_resource" "login_profile" {
  count = "${!var.enabled || !var.create_login_profile || local.requirement_login_profile ? 0 : 1}"
  "ERROR: When you set create_login_profile to true, you must also set login_profile_password_reset_required (bool) and login_profile_pgp_key (string)" = true
}

resource "aws_iam_user_login_profile" "login_profile" {
  count                   = "${var.enabled && var.create_login_profile ? 1 : 0}"
  user                    = "${aws_iam_user.user.name}"
  pgp_key                 = "${var.login_profile_pgp_key}"
  password_length         = "${var.login_profile_password_length}"
  password_reset_required = "${var.login_profile_password_reset_required}"
  depends_on              = ["aws_iam_user.user"]
  lifecycle {
    ignore_changes        = ["password_length", "password_reset_required", "pgp_key"]
  }
}

# Uploads an SSH public key and associates it with the user.
# resource "null_resource" "ssh_key" {
#   count = "${!var.enabled || !var.upload_ssh_key || local.requirement_ssh_key ? 0 : 1}"
#   "ERROR: When you set upload_ssh_key to true, you must also set ssh_key_public_key (string)" = true
# }

resource "aws_iam_user_ssh_key" "ssh_key" {
  count      = "${var.enabled && var.upload_ssh_key ? 1 : 0}"
  username   = "${aws_iam_user.user.name}"
  encoding   = "${var.ssh_key_encoding}"
  public_key = "${var.ssh_key_public_key}"
  status     = "${var.ssh_key_status}"
  depends_on = ["aws_iam_user.user"]
}
