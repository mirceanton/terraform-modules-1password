data "onepassword_vault" "this" {
  name = var.vault_name
}

resource "onepassword_item" "items" {
  for_each = var.secrets

  vault      = data.onepassword_vault.this.uuid
  title      = each.key
  category   = each.value.category
  username   = each.value.username
  password   = each.value.password
  url        = each.value.url
  note_value = coalesce(each.value.notes, var.notes)
  tags       = each.value.tags
  hostname   = each.value.hostname
  port       = each.value.port
  database   = each.value.database
  type       = each.value.db_type

  dynamic "section" {
    for_each = each.value.sections
    content {
      label = section.value.label
      dynamic "field" {
        for_each = section.value.fields
        content {
          label = field.value.label
          type  = field.value.type
          value = field.value.value
        }
      }
    }
  }
}
