# Terraform Google Cloud Certificate Manager mTLS Module

This Terraform module configures Google Cloud Certificate Manager to enforce mutual TLS (mTLS) for a specified hostname. It creates the necessary resources to manage certificates, map them to a domain, and enforce mTLS through a server TLS policy.

## Resources Created

This module creates the following Google Cloud resources:

-   `google_project_service`: Enables the Certificate Manager API.
-   `google_certificate_manager_certificate_map`: A map to hold certificate entries.
-   `google_certificate_manager_certificate`: A self-managed certificate resource.
-   `google_certificate_manager_certificate_map_entry`: Maps the certificate to a hostname.
-   `google_certificate_manager_trust_config`: A trust configuration for client certificate validation.
-   `google_network_security_server_tls_policy`: A server TLS policy to enforce mTLS.

## Usage

Here is a basic example of how to use the module:

```hcl
module "gcp_mtls" {
  source = "./"

  certificate_map_name       = "my-cert-map"
  certificate_map_entry_name = "my-cert-map-entry"
  hostname                   = "myapp.example.com"
  certificate_name           = "my-certificate"
  server_cert_file           = "path/to/server.crt"
  server_private_key_file    = "path/to/server.key"
  intermediate_cert_file     = "path/to/intermediate.crt"
  trust_anchor_cert_file     = "path/to/ca.crt"
  trust_config_name          = "my-trust-config"
  server_tls_policy_name     = "my-tls-policy"
  location                   = "global"
}
```

## Input Variables

| Name                         | Description                                        | Type   | Default                                            |
| ---------------------------- | -------------------------------------------------- | ------ | -------------------------------------------------- |
| `certificate_map_name`       | Name of the certificate map                        | `string` | `"certificate-map"`                                  |
| `certificate_map_entry_name` | Name of the certificate map entry                  | `string` | `"certificate-map-entry"`                            |
| `hostname`                   | Hostname for the certificate map entry             | `string` | `"test.attempt.com"`                               |
| `certificate_name`           | Name of the certificate                            | `string` | `"certificate"`                                    |
| `server_cert_file`           | Path to the server PEM certificate file            | `string` | `"/home/admin_/project/folder/server_cert.pem"`      |
| `server_private_key_file`    | Path to the server PEM private key file            | `string` | `"/home/admin_/project/folder/server_key_decrypted.pem"` |
| `intermediate_cert_file`     | Path to the intermediate PEM certificate file      | `string` | `"/home/admin_/project/folder/intermediate_cert.pem"`|
| `trust_anchor_cert_file`     | Path to the trust anchor certificate file          | `string` | `"/home/admin_/project/folder/root_cert.pem"`        |
| `trust_config_name`          | Name of the trust configuration                    | `string` | `"my-trust-config-poc"`                              |
| `server_tls_policy_name`     | Name of the server TLS policy                      | `string` | `"my-server-tls-policy-poc"`                         |
| `location`                   | Location for trust configuration and TLS policy    | `string` | `"global"`                                         |

## Outputs

| Name                         | Description                               |
| ---------------------------- | ----------------------------------------- |
| `certificate_map_name`       | The name of the created certificate map   |
| `certificate_name`           | The name of the created certificate       |
| `certificate_map_entry_name` | The name of the created certificate map entry |
| `trust_config_name`          | The name of the created trust configuration |
| `server_tls_policy_name`     | The name of the created server TLS policy |
