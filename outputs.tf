output "azurerm_public_ip" {
  value = azurerm_public_ip.azuredevops_publicip.ip_address
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}


output "password_not_hidden" {
  value     = nonsensitive(azurerm_key_vault_secret.key.value)
  
}

