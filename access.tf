# Cloudflare Access

resource "cloudflare_access_application" "access" {
  count                     = length(var.access)
  zone_id                   = cloudflare_zone.site.id
  name                      = var.access[count.index].name
  domain                    = var.access[count.index].domain
  type                      = "self_hosted"
  session_duration          = "24h"
  auto_redirect_to_identity = true
}

resource "cloudflare_access_policy" "support_policy" {
  count          = length(var.access)
  application_id = cloudflare_access_application.access[count.index].id
  zone_id        = cloudflare_zone.site.id
  name           = var.access[count.index].name
  precedence     = "1"
  decision       = "allow"

  include {
    group = [var.access[count.index].group.id]
  }
}
