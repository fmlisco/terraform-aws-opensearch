resource "opensearch_role" "this" {
  role_name   = var.name
  description = var.description

  cluster_permissions = var.cluster_permissions

  dynamic "index_permissions" {
    for_each = var.index_permissions

    content {
      index_patterns          = toset([index_permissions.key])
      allowed_actions         = index_permissions.value.allowed_actions
      document_level_security = index_permissions.value.document_level_security
      field_level_security    = index_permissions.value.field_level_security
      masked_fields           = index_permissions.value.masked_fields
    }
  }

  dynamic "tenant_permissions" {
    for_each = var.tenant_permissions
    content {
      tenant_patterns = toset([tenant_permissions.key])
      allowed_actions = tenant_permissions.value
    }
  }
}

resource "opensearch_roles_mapping" "this" {
  count = length(setunion(var.backend_roles, var.users)) > 0 ? 1 : 0

  role_name   = opensearch_role.this.role_name
  description = "Role mapping for ${var.name}"

  backend_roles = var.backend_roles
  users         = var.users
}
