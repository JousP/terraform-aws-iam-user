# Custom deployment Example
## Description
This example deploys :  
- 1 tls_private_key.ssh_alice : a SSH Key to upload the public part and associate it with the user `alice` (to be used with code commit)
- 1 aws_iam_user
- 1 aws_iam_access_key
- 1 aws_iam_user_login_profile : with its password encrypted in the terraform state using a pgp key
- 1 aws_iam_user_ssh_key

It also associate 2 IAM policies to the user.

## Use the example
Follow these instruction to use this example :  
- edit the `custom-usage.tf`
- run `terraform init`
- then you can run `terraform plan` and `terraform apply`

Don't forget to run `terraform destroy` if you were just running tests.