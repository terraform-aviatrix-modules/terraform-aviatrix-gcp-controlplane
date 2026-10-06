terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    http = {
      source = "hashicorp/http"
    }
  }
  required_version = ">= 1.3"
}
