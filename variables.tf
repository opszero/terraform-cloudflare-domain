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

variable "ssl_forced" {
  default     = true
  description = "Force SSL on Domains"
}

variable "google_email_enabled" {
  default     = true
  description = "Enable Google MX Records"
}

variable "account_id" {
  description = "Cloudflare account id"
}
