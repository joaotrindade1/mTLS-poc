# Terraform Module: Google Cloud mTLS Configuration

This Terraform module configures mutual TLS (mTLS) on Google Cloud Platform (GCP). It sets up the necessary resources in the Google Cloud Certificate Manager and Network Security services to enforce mTLS for your applications.

## Prerequisites

Before using this module, you must have the following:

- A Google Cloud Platform project.
- The `gcloud` CLI installed and configured with credentials for your project.
- Terraform installed (version x.x.x or later).
- The following certificate files in PEM format:
    - Server certificate
    - Server private key
    - Intermediate CA certificate
    - Root CA certificate (trust anchor)

## Usage

To use this module, include it in your Terraform configuration as follows:

```hcl
module "mtls" {
  source = "./path/to/this/module"

  # Certificate Map and Entries
  certificate_map_name       = "my-certificate-map"
  certificate_map_entry_name = "my-certificate-map-entry"
  hostname                   = "myapp.example.com"

  # Certificates
  certificate_name          = "my-server-certificate"
  server_cert_file          = "path/to/your/server_cert.pem"
  server_private_key_file   = "path/to/your/server_key.pem"
  intermediate_cert_file    = "path/to/your/intermediate_cert.pem"
  trust_anchor_cert_file    = "path/to/your/root_cert.pem"

  # Trust Configuration and TLS Policy
  trust_config_name      = "my-trust-config"
  server_tls_policy_name = "my-server-tls-policy"

  # Location
  location = "global"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `certificate_map_name` | Name of the certificate map. | `string` | `"certificate-map"` | No |
| `certificate_map_entry_name` | Name of the certificate map entry. | `string` | `"certificate-map-entry"` | No |
| `hostname` | Hostname for the certificate map entry. | `string` | `"test.attempt.com"` | No |
| `certificate_name` | Name of the certificate. | `string` | `"certificate"` | No |
| `server_cert_file` | Path to the server PEM certificate file. | `string` | `"/home/admin_/project/folder/server_cert.pem"` | Yes |
| `server_private_key_file` | Path to the server PEM private key file. | `string` | `"/home/admin_/project/folder/server_key_decrypted.pem"` | Yes |
| `intermediate_cert_file` | Path to the intermediate PEM certificate file. | `string` | `"/home/admin_/project/folder/intermediate_cert.pem"` | Yes |
| `trust_anchor_cert_file` | Path to the trust anchor certificate file. | `string` | `"/home/admin_/project/folder/root_cert.pem"` | Yes |
| `trust_config_name` | Name of the trust configuration. | `string` | `"my-trust-config-poc"` | No |
| `server_tls_policy_name` | Name of the server TLS policy. | `string` | `"my-server-tls-policy-poc"` | No |
| `location` | Location for trust configuration and TLS policy. | `string` | `"global"` | No |

## Outputs

| Name | Description |
|------|-------------|
| `certificate_map_name` | The name of the created certificate map. |
| `certificate_name` | The name of the created certificate. |
| `certificate_map_entry_name` | The name of the created certificate map entry. |
| `trust_config_name` | The name of the created trust configuration. |
| `server_tls_policy_name` | The name of the created server TLS policy. |
