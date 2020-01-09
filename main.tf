# Create an IAM user
resource "aws_iam_user" "user" {
  count                = var.enabled ? 1 : 0
  name                 = var.name
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  force_destroy        = var.force_destroy
  tags                 = var.tags
}

# Attach the Managed Policies to the user
resource "aws_iam_user_policy_attachment" "policies" {
  count      = var.enabled ? var.policies_count : 0
  user       = aws_iam_user.user[0].name
  policy_arn = element(var.policies, count.index)
  depends_on = [aws_iam_user.user]
}

# Attach the In-line Policies to the user
resource "aws_iam_user_policy" "json_policies" {
  count      = var.enabled ? var.json_policies_count : 0
  name       = "${var.name}-${count.index}"
  policy     = element(var.json_policies, count.index)
  user       = aws_iam_user.user[0].name
  depends_on = [aws_iam_user.user]
}

resource "aws_iam_access_key" "access_key" {
  count      = var.enabled && var.create_access_key ? 1 : 0
  user       = aws_iam_user.user[0].name
  pgp_key    = var.access_key_pgp_key
  status     = var.access_key_status
  depends_on = [aws_iam_user.user]
}

resource "aws_iam_user_login_profile" "login_profile" {
  count                   = var.enabled && var.create_login_profile ? 1 : 0
  user                    = aws_iam_user.user[0].name
  pgp_key                 = var.login_profile_pgp_key
  password_length         = var.login_profile_password_length
  password_reset_required = var.login_profile_password_reset_required
  depends_on              = [aws_iam_user.user]
  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}

resource "aws_iam_user_ssh_key" "ssh_key" {
  count      = var.enabled && var.upload_ssh_key ? 1 : 0
  username   = aws_iam_user.user[0].name
  encoding   = var.ssh_key_encoding
  public_key = var.ssh_key_public_key
  status     = var.ssh_key_status
  depends_on = [aws_iam_user.user]
}

