# Enable the Certificate Manager API
resource "google_project_service" "certificatemanager" {
  service            = "certificatemanager.googleapis.com"
  disable_on_destroy = false
}

# Create a Certificate Map
resource "google_certificate_manager_certificate_map" "certificate_map" {
  name       = var.certificate_map_name
  depends_on = [google_project_service.certificatemanager]
}

# Load self-managed certificate and private key
resource "google_certificate_manager_certificate" "certificate" {
  name  = var.certificate_name
  scope = "DEFAULT"

  self_managed {
    pem_certificate = file(var.server_cert_file)
    pem_private_key = file(var.server_private_key_file)
  }

  depends_on = [
    google_project_service.certificatemanager,
    google_certificate_manager_certificate_map.certificate_map
  ]
}

# Map certificate to the specified hostname
resource "google_certificate_manager_certificate_map_entry" "certificate_map_entry" {
  name         = var.certificate_map_entry_name
  map          = google_certificate_manager_certificate_map.certificate_map.name
  hostname     = var.hostname
  certificates = [google_certificate_manager_certificate.certificate.id]
}

# Define a trust configuration for client certificate validation
resource "google_certificate_manager_trust_config" "trust_config" {
  name     = var.trust_config_name
  location = var.location

  trust_stores {
    trust_anchors {
      pem_certificate = file(var.trust_anchor_cert_file)
    }
    intermediate_cas {
      pem_certificate = file(var.intermediate_cert_file)
    }
  }
}

# Create a TLS policy enforcing mutual TLS (mTLS) with strict validation
resource "google_network_security_server_tls_policy" "server_tls_policy" {
  name     = var.server_tls_policy_name
  location = var.location

  mtls_policy {
    client_validation_mode       = "REJECT_INVALID"
    client_validation_trust_config = google_certificate_manager_trust_config.trust_config.id
  }

  depends_on = [google_certificate_manager_trust_config.trust_config]
}