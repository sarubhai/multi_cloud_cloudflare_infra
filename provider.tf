# Name: provider.tf
# Owner: Saurav Mitra
# Description: This terraform config will Configure Terraform Providers
# https://www.terraform.io/docs/language/providers/requirements.html

terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}

# Configure Terraform Cloudflare Provider
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs

# $ export CLOUDFLARE_EMAIL="john.doe@example.com"
# $ export CLOUDFLARE_API_KEY="a1b2c3d4e5f6g7h8i9j"
# $ export CLOUDFLARE_ACCOUNT_ID="z1y2x3w4v5u6t7s8r9q"
# $ export CLOUDFLARE_API_CLIENT_LOGGING=true

provider "cloudflare" {
  # Configuration options
}
