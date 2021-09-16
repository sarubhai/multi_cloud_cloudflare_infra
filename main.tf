# main.tf
# Owner: Saurav Mitra
# Description: This terraform config will create following Cloudflare resources:
# Zone Settings
# DNS Records

# Cloudflare Zone
data "cloudflare_zones" "site" {
  filter {
    name = var.domain_name
  }
}

# Zone Settings
resource "cloudflare_zone_settings_override" "site_settings" {
  zone_id = lookup(data.cloudflare_zones.site.zones[0], "id")
  settings {
    always_online            = "on"
    always_use_https         = "off"
    automatic_https_rewrites = "off"
    brotli                   = "off"
    browser_cache_ttl        = 0
    browser_check            = "on"
    cache_level              = "aggressive"
    challenge_ttl            = 300
    development_mode         = "on"
    h2_prioritization        = "off"
    hotlink_protection       = "off"
    ip_geolocation           = "off"
    max_upload               = 100
    min_tls_version          = "1.0"
    minify {
      css  = "on"
      html = "on"
      js   = "on"
    }
    opportunistic_encryption = "off"
    opportunistic_onion      = "on"
    privacy_pass             = "on"
    security_header {
      enabled            = true
      include_subdomains = true
      max_age            = 0
      nosniff            = false
      preload            = false
    }
    security_level      = "medium"
    server_side_exclude = "on"
    ssl                 = "off"
    tls_1_3             = "off"
    tls_client_auth     = "off"
    universal_ssl       = "off"
  }
}

# DNS Records
resource "cloudflare_record" "aws_web" {
  zone_id = lookup(data.cloudflare_zones.site.zones[0], "id")
  name    = "@"
  value   = data.terraform_remote_state.aws.outputs.web_public_ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "azure_web" {
  zone_id = lookup(data.cloudflare_zones.site.zones[0], "id")
  name    = "@"
  value   = data.terraform_remote_state.azure.outputs.web_public_ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "do_web" {
  zone_id = lookup(data.cloudflare_zones.site.zones[0], "id")
  name    = "@"
  value   = data.terraform_remote_state.do.outputs.web_public_ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "gcp_web" {
  zone_id = lookup(data.cloudflare_zones.site.zones[0], "id")
  name    = "@"
  value   = data.terraform_remote_state.gcp.outputs.web_public_ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}
