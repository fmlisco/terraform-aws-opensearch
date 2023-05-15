terraform {
  required_version = ">= 1.3"

  required_providers {
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = "~> 2.0.7"
    }
  }
}
