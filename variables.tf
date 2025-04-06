# Certificate Map and Entries
variable "certificate_map_name" {
  description = "Name of the certificate map"
  type        = string
  default     = "certificate-map"
}

variable "certificate_map_entry_name" {
  description = "Name of the certificate map entry"
  type        = string
  default     = "certificate-map-entry"
}

variable "hostname" {
  description = "Hostname for the certificate map entry"
  type        = string
  default     = "test.attempt.com"
}

# Certificates
variable "certificate_name" {
  description = "Name of the certificate"
  type        = string
  default     = "certificate"
}

variable "server_cert_file" {
  description = "Path to the server PEM certificate file"
  type        = string
  default     = "/home/admin_/project/folder/server_cert.pem"
}

variable "server_private_key_file" {
  description = "Path to the server PEM private key file"
  type        = string
  default     = "/home/admin_/project/folder/server_key_decrypted.pem"
}

variable "intermediate_cert_file" {
  description = "Path to the intermediate PEM certificate file"
  type        = string
  default     = "/home/admin_/project/folder/intermediate_cert.pem"
}

variable "trust_anchor_cert_file" {
  description = "Path to the trust anchor certificate file"
  type        = string
  default     = "/home/admin_/project/folder/root_cert.pem"
}

# Trust Configuration and TLS Policy
variable "trust_config_name" {
  description = "Name of the trust configuration"
  type        = string
  default     = "my-trust-config-poc"
}

variable "server_tls_policy_name" {
  description = "Name of the server TLS policy"
  type        = string
  default     = "my-server-tls-policy-poc"
}

# Location
variable "location" {
  description = "Location for trust configuration and TLS policy"
  type        = string
  default     = "global"
}
