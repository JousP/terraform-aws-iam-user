module "user_bob" {
  source  = "JousP/iam-user/aws"
  version = "~> 3.1"
  name    = "bob"
}
