terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

provider "local" {
  # Configuration options
}

variable "FILE_NAME" {
  type = string
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/${var.FILE_NAME}"
}

output "foo_sha256" {
    value = local_file.foo.content_sha256
}
