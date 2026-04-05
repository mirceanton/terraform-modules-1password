output "item_ids" {
  description = "Map of secret title to 1Password item UUID"
  value       = { for k, v in onepassword_item.items : k => v.uuid }
}
