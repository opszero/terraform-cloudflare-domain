variable "domain" {
  description = "domain for the webapp"
}

variable "records" {
  default     = []
  description = "List of DNS records"
}

variable "access" {
  default     = []
  description = "List of access applications"
}
