terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.7.0"
    }
  }
}

# Create new storage bucket in the US
# location with Standard Storage

variable "GOOGLE_CLOUD_PROJECT_ID" {
  type = string
}

variable "BUCKET_NAME" {
  type = string
}

variable "OBJECT_NAME" {
  type = string
}

provider "google" {
  project = var.GOOGLE_CLOUD_PROJECT_ID
}

resource "google_storage_bucket" "static" {
 name          = "${var.BUCKET_NAME}"
 location      = "US"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
}

# Upload a text file as an object
# to the storage bucket

resource "google_storage_bucket_object" "default" {
 name         = "${var.OBJECT_NAME}"
 source       = "${pathexpand("${path.module}/UPLOAD_ME.txt")}"
 content_type = "text/plain"
 bucket       = google_storage_bucket.static.id
}
