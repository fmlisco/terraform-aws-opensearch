module "role" {
  source = "../../modules/role"

  name        = "reader"
  description = "Opensearch reader role"

  cluster_permissions = ["*"]

  index_permissions = {
    "test-index-*" = {
      allowed_actions = ["read"]
    }
  }

  tenant_permissions = {
    "test-index-*" = ["read"]
  }

  backend_roles = [
    "arn:aws:iam::999999999999:role/TestReaderRole",
  ]

  users = [
    "arn:aws:iam::999999999999:user/TestUser",
  ]
}
