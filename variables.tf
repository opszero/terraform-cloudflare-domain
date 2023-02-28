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

variable "account_id" {
  description = "Account ID to manage the zone resource in"
}