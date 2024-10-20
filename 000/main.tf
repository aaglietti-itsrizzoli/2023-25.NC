terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
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

resource "random_integer" "randint" {
  min = 1
  max = 50000
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    filename = local_file.foo.filename
  }
}

output "foo_sha256" {
    value = local_file.foo.content_sha256
}

output "random_value" {
    value = random_integer.randint.result
}
