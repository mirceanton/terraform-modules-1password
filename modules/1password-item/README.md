# 1password-item

Manages a set of items in a single 1Password vault.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_onepassword"></a> [onepassword](#requirement\_onepassword) | >= 3.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_onepassword"></a> [onepassword](#provider\_onepassword) | >= 3.3.1 |

## Resources

| Name | Type |
|------|------|
| [onepassword_item.items](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_notes"></a> [notes](#input\_notes) | Default note to inject into every secret. Can be overridden per secret. | `string` | `null` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Map of secrets to create/update in the 1Password vault | <pre>map(object({<br/>    category = optional(string, "password")<br/>    username = optional(string)<br/>    password = optional(string)<br/>    url      = optional(string)<br/>    notes    = optional(string)<br/>    tags     = optional(list(string))<br/><br/>    # Database-specific fields (only relevant when category = "database")<br/>    hostname = optional(string)<br/>    port     = optional(string)<br/>    database = optional(string)<br/>    db_type  = optional(string) # db2, filemaker, msaccess, mssql, mysql, oracle, postgresql, sqlite, other<br/><br/>    # Custom sections with typed fields<br/>    sections = optional(list(object({<br/>      label = string<br/>      fields = optional(list(object({<br/>        label = string<br/>        type  = optional(string, "STRING") # STRING, CONCEALED, EMAIL, URL, OTP, DATE, MONTH_YEAR, MENU<br/>        value = optional(string)<br/>      })), [])<br/>    })), [])<br/>  }))</pre> | n/a | yes |
| <a name="input_vault_name"></a> [vault\_name](#input\_vault\_name) | The name of the 1Password vault to inject secrets into | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_item_ids"></a> [item\_ids](#output\_item\_ids) | Map of secret title to 1Password item UUID |
<!-- END_TF_DOCS -->
