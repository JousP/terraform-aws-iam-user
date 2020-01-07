# terraform-aws-iam-user
Terraform module to deploy an iam user and related resources (access keys, ssh keys, etc.)
This module creates :
- 1 aws_iam_user
- And attach every provided policies (ARN or json) to the user

Policies can be passed in json (json_policies and json_policies_count variables) or by their ARN (policies and policies_count variables).
Because we use a count instead of a for_each to associate policies, you need to adjust the `policies_count` and `json_policies_count` variables based on the number of policies of each kind provided.

The following additional resources can also be created:
- 1 aws_iam_user_login_profile
- 1 aws_iam_access_key
- 1 aws_iam_user_ssh_key
