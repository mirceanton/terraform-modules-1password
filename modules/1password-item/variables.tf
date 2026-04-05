variable "vault_name" {
  description = "The name of the 1Password vault to inject secrets into"
  type        = string
}

variable "notes" {
  description = "Default note to inject into every secret. Can be overridden per secret."
  type        = string
  default     = null
}

variable "secrets" {
  description = "Map of secrets to create/update in the 1Password vault"
  type = map(object({
    category = optional(string, "password")
    username = optional(string)
    password = optional(string)
    url      = optional(string)
    notes    = optional(string)
    tags     = optional(list(string))

    # Database-specific fields (only relevant when category = "database")
    hostname = optional(string)
    port     = optional(string)
    database = optional(string)
    db_type  = optional(string) # db2, filemaker, msaccess, mssql, mysql, oracle, postgresql, sqlite, other

    # Custom sections with typed fields
    sections = optional(list(object({
      label = string
      fields = optional(list(object({
        label = string
        type  = optional(string, "STRING") # STRING, CONCEALED, EMAIL, URL, OTP, DATE, MONTH_YEAR, MENU
        value = optional(string)
      })), [])
    })), [])
  }))
}
