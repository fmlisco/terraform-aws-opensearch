terraform {
  required_version = ">= 1.4"

  required_providers {
    opensearch = {
      source  = "opensearch-project/opensearch"
      version = ">= 1.0"
    }
  }
}
