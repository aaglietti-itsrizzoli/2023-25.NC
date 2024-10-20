terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.7.0"
    }
  }
}

variable "GOOGLE_CLOUD_PROJECT_ID" {
  type = string
}

provider "google" {
  project = var.GOOGLE_CLOUD_PROJECT_ID
}

locals {
  USERS = csvdecode(file("${path.module}/gcp_viewers.csv"))
}

resource "google_project_iam_member" "project" {
  for_each = tomap({ for user in local.USERS : user.user_id => user })
  project = var.GOOGLE_CLOUD_PROJECT_ID
  role    = "roles/viewer"
  member = "user:${each.value.user_email}"
}
