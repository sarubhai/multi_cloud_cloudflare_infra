# variables.tf
# Owner: Saurav Mitra
# Description: Variables used by terraform config to create the Cloudflare resources
# https://www.terraform.io/docs/configuration/variables.html

# Cloudflare Zone
variable "domain_name" {
  description = "The DNS zone or Domain name."
}

variable "domain_plan" {
  description = "The name of the commercial plan to apply to the zone."
  default     = "free"
}


variable "aws_web" {
  description = "DNS Record to AWS Web Server"
  default     = true
}

variable "azure_web" {
  description = "DNS Record to Azure Web Server"
  default     = false
}

variable "do_web" {
  description = "DNS Record to DO Web Server"
  default     = false
}

variable "gcp_web" {
  description = "DNS Record to GCP Web Server"
  default     = false
}
