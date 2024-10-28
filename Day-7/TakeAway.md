# Key Take aways

## Hands on

- Manually set up vault in a ubuntu machine
- Implemented terraform provider to retrieve credentials from vault

## Vault

- Used for secret management (API keys, passwords, or tokens)
- Provides dynamic secrets and access policies, ensuring only authorized entities can retrieve or update sensitive information
- Dynamic Secrets - Vault generates temporary, time0bound credentials that Terraform can use during infra provisioning
- Vault Provider - Terraform integrates with vault via the vault provider
