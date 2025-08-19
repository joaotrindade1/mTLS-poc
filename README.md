# Terraform Module: Google Cloud mTLS Configuration

This Terraform module configures a mutual TLS (mTLS) setup on Google Cloud Platform (GCP) using the Certificate Manager and Network Security services. It automates the creation of necessary resources for securing communications with mTLS.

## Features

- **Automated mTLS Setup:** Simplifies the process of configuring mTLS on GCP.
- **Certificate Management:** Manages server certificates and private keys using Google Certificate Manager.
- **Trust Configuration:** Establishes a trust configuration for validating client certificates.
- **TLS Policy Enforcement:** Creates and applies a server TLS policy to enforce mTLS.
- **Customizable Naming:** Allows for custom names for all created resources.

## Usage

To use this module, include the following in your Terraform configuration:

```hcl
module "mtls_config" {
  source = "./path/to/your/module"

  certificate_map_name       = "my-certificate-map"
  certificate_map_entry_name = "my-certificate-map-entry"
  hostname                   = "your.domain.com"
  certificate_name           = "my-certificate"
  server_cert_file           = "path/to/server_cert.pem"
  server_private_key_file    = "path/to/server_key_decrypted.pem"
  intermediate_cert_file     = "path/to/intermediate_cert.pem"
  trust_anchor_cert_file     = "path/to/root_cert.pem"
  trust_config_name          = "my-trust-config"
  server_tls_policy_name     = "my-server-tls-policy"
  location                   = "global"
}
```

## Inputs

| Name                         | Description                                    | Type   | Default                                            |
| ---------------------------- | ---------------------------------------------- | ------ | -------------------------------------------------- |
| `certificate_map_name`       | Name of the certificate map                    | `string` | `"certificate-map"`                                  |
| `certificate_map_entry_name` | Name of the certificate map entry              | `string` | `"certificate-map-entry"`                            |
| `hostname`                   | Hostname for the certificate map entry         | `string` | `"test.attempt.com"`                                 |
| `certificate_name`           | Name of the certificate                        | `string` | `"certificate"`                                      |
| `server_cert_file`           | Path to the server PEM certificate file        | `string` | `"/home/admin_/project/folder/server_cert.pem"`        |
| `server_private_key_file`    | Path to the server PEM private key file        | `string` | `"/home/admin_/project/folder/server_key_decrypted.pem"` |
| `intermediate_cert_file`     | Path to the intermediate PEM certificate file  | `string` | `"/home/admin_/project/folder/intermediate_cert.pem"`  |
| `trust_anchor_cert_file`     | Path to the trust anchor certificate file      | `string` | `"/home/admin_/project/folder/root_cert.pem"`          |
| `trust_config_name`          | Name of the trust configuration                | `string` | `"my-trust-config-poc"`                              |
| `server_tls_policy_name`     | Name of the server TLS policy                  | `string` | `"my-server-tls-policy-poc"`                         |
| `location`                   | Location for trust configuration and TLS policy| `string` | `"global"`                                           |

## Outputs

| Name                         | Description                               |
| ---------------------------- | ----------------------------------------- |
| `certificate_map_name`       | The name of the created certificate map   |
| `certificate_name`           | The name of the created certificate       |
| `certificate_map_entry_name` | The name of the created certificate map entry |
| `trust_config_name`          | The name of the created trust configuration |
| `server_tls_policy_name`     | The name of the created server TLS policy |
