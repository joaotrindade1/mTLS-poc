output "certificate_map_name" {
  description = "The name of the created certificate map"
  value       = google_certificate_manager_certificate_map.certificate_map.name
}

output "certificate_name" {
  description = "The name of the created certificate"
  value       = google_certificate_manager_certificate.certificate.name
}

output "certificate_map_entry_name" {
  description = "The name of the created certificate map entry"
  value       = google_certificate_manager_certificate_map_entry.certificate_map_entry.name
}

output "trust_config_name" {
  description = "The name of the created trust configuration"
  value       = google_certificate_manager_trust_config.trust_config.name
}

output "server_tls_policy_name" {
  description = "The name of the created server TLS policy"
  value       = google_network_security_server_tls_policy.server_tls_policy.name
}