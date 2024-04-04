variable "name" {
  description = "Opensearch role name"
  type        = string
}

variable "description" {
  description = "Opensearch role description"
  type        = string
  default     = ""
}

variable "cluster_permissions" {
  description = "Set of cluster permissions to apply to the role"
  type        = set(string)
}

variable "index_permissions" {
  description = "Map of index pattern to permissions to apply to the pattern"
  type = map(object(
    {
      allowed_actions         = set(string)
      masked_fields           = optional(set(string))
      document_level_security = optional(string)
      field_level_security    = optional(set(string))
    }
  ))
}

variable "tenant_permissions" {
  description = "Map of tenant pattern to set of permissions to apply to the pattern"
  type        = map(set(string))
}

variable "backend_roles" {
  description = "(Optional) Set of backend roles to map to the Opensearch role"
  type        = set(string)
  default     = []
}

variable "users" {
  description = "(Optional) Set of users to map to the Opensearch role"
  type        = set(string)
  default     = []
}
