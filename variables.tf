variable "domain" {
  description = "domain for the webapp"
}

variable "records" {
  default     = []
  description = "List of DNS records"
}

variable "parking" {
  default = false
}

variable "dynamodb" {
  default     = false
  description = "Specify whether DynamoDB is enabled"
}

variable "access" {
  default     = []
  description = "List of access applications"
}
