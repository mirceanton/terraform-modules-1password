# terraform-modules-1password

A collection of reusable OpenTofu/Terraform modules for managing 1Password resources.

## Modules

| Module | Description |
|--------|-------------|
| [1password-item](./modules/1password-item) | Manages a set of items in a single 1Password vault |

## Usage

### OCI Registry (OpenTofu >= 1.8)

```hcl
module "secrets" {
  source  = "oci://ghcr.io/mirceanton/terraform-modules-1password/1password-item"
  version = "v0.1.0"
}
```

### Git Source

```hcl
module "secrets" {
  source = "git::https://github.com/mirceanton/terraform-modules-1password.git//modules/1password-item?ref=v0.1.0"
}
```
