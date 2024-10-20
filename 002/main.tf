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

variable "CLOUD_RUN_SERVICE_NAME" {
  type = string
}

provider "google" {
  project = var.GOOGLE_CLOUD_PROJECT_ID
}

resource "google_cloud_run_v2_service" "default" {
  name                = var.CLOUD_RUN_SERVICE_NAME
  location            = "us-central1"
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}

resource "google_cloud_run_service_iam_binding" "default" {
  location = google_cloud_run_v2_service.default.location
  service  = google_cloud_run_v2_service.default.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}

output "cloud_run_service_uri" {
  value = google_cloud_run_v2_service.default.uri
}
