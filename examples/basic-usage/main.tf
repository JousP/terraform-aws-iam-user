module "user_bob" {
  source  = "JousP/iam-user/aws"
  version = "~> 3.0"
  name    = "bob"
}
