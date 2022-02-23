variable "domain" {
  description = "domain for the webapp"
}

variable "records" {
  default = []
}

variable "parking" {
  default = false
}

variable "dynamodb" {
  default = false
}

variable "access" {
  default = []
}
