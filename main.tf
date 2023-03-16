locals {
  mx_server_domains = [
    "aspmx.l.google.com",
    "alt1.aspmx.l.google.com",
    "alt2.aspmx.l.google.com",
    "alt3.aspmx.l.google.com",
    "alt4.aspmx.l.google.com",
  ]
}

resource "cloudflare_zone" "site" {
  zone       = var.domain
  account_id = var.account_id
}

resource "aws_ses_domain_identity" "ses" {
  count  = var.aws_ses_enabled ? 1 : 0
  domain = var.domain
}

resource "cloudflare_record" "ses" {
  count   = var.aws_ses_enabled ? 1 : 0
  zone_id = cloudflare_zone.site.id
  name    = "_amazonses"
  value   = aws_ses_domain_identity.ses.verification_token
  type    = "TXT"
  ttl     = 600
  proxied = false
}

resource "aws_ses_domain_dkim" "dkim" {
  count  = var.aws_ses_enabled ? 1 : 0
  domain = aws_ses_domain_identity.ses.domain
}

resource "cloudflare_record" "dkim" {
  count   = var.aws_ses_enabled ? 3 : 0
  zone_id = cloudflare_zone.site.id
  name    = "${element(aws_ses_domain_dkim.dkim.dkim_tokens, count.index)}._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = "600"
  value   = "${element(aws_ses_domain_dkim.dkim.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "records" {
  count = length(var.records)

  zone_id = cloudflare_zone.site.id
  name    = var.records[count.index].name
  value   = var.records[count.index].value
  type    = var.records[count.index].type
  proxied = var.records[count.index].proxied
  ttl     = 1
}

resource "cloudflare_page_rule" "ssl" {
  count = var.ssl_forced ? 1 : 0

  zone_id  = cloudflare_zone.site.id
  target   = "*${var.domain}/*"
  priority = 1

  actions {
    ssl                      = "flexible"
    always_use_https         = true
    automatic_https_rewrites = "on"
  }
}

resource "cloudflare_record" "mx" {
  count = var.google_email_enabled ? length(local.mx_server_domains) : 0

  zone_id  = cloudflare_zone.site.id
  name     = "@"
  value    = local.mx_server_domains[count.index]
  priority = count.index + 1
  type     = "MX"
  ttl      = 3600
}

resource "cloudflare_record" "spf" {
  count   = var.google_email_enabled ? 1 : 0
  zone_id = cloudflare_zone.site.id
  name    = "@"
  type    = "TXT"
  value   = "v=spf1 include:_spf.google.com ~all"
  ttl     = 3600
}
