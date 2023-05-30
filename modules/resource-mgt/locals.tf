locals {
  # Filter out ISM policies that require creation
  new_ism_policies = { for k, v in var.ism_policies : k => v if v.create }

  # Filter out ISM policies that are pre-existing
  existing_ism_policies = { for k, v in var.ism_policies : k => v if v.create == false }
}
