# ======================
# SQL Server
# ======================
output "sql_server_fqdn" {
  description = "FQDN público del SQL Server (solo para referencia, ya que public_network_access está deshabilitado)"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_database_name" {
  description = "Nombre de la base de datos desplegada en SQL Server"
  value       = azurerm_mssql_database.database.name
}

# ======================
# App Services - Públicos
# ======================
output "app_service_backend_url" {
  description = "Hostname público del App Service Backend (PHP con comando de inicio Nginx)"
  value       = azurerm_linux_web_app.backend.default_hostname
}

output "app_service_frontend_url" {
  description = "Hostname público del App Service Frontend (Windows, creado limpio sin despliegue automático)"
  value       = azurerm_windows_web_app.frontend.default_hostname
}

# ======================
# App Services - Privados
# ======================
output "app_service_backend_private_ip" {
  description = "IP privada del Private Endpoint del Backend"
  value       = azurerm_private_endpoint.backend_pe.private_service_connection[0].private_ip_address
}

output "app_service_frontend_private_ip" {
  description = "IP privada del Private Endpoint del Frontend"
  value       = azurerm_private_endpoint.frontend_pe.private_service_connection[0].private_ip_address
}

# ======================
# Private Endpoints (otros servicios)
# ======================
output "sql_private_ip" {
  description = "IP privada del Private Endpoint del SQL Server"
  value       = azurerm_private_endpoint.sql_pe.private_service_connection[0].private_ip_address
}

output "keyvault_private_ip" {
  description = "IP privada del Private Endpoint del Key Vault"
  value       = azurerm_private_endpoint.keyvault_pe.private_service_connection[0].private_ip_address
}

output "blob_private_ip" {
  description = "IP privada del Private Endpoint del Blob Storage"
  value       = azurerm_private_endpoint.blob_pe.private_service_connection[0].private_ip_address
}

# ======================
# Networking
# ======================
output "vnet_id" {
  description = "ID de la VNet principal"
  value       = azurerm_virtual_network.vnet.id
}

# Subnets
output "subnet_backend_id" {
  description = "ID de la subred para el App Service Backend"
  value       = azurerm_subnet.backend.id
}

output "subnet_sql_id" {
  description = "ID de la subred para el SQL Server"
  value       = azurerm_subnet.sql.id
}

output "subnet_keyvault_id" {
  description = "ID de la subred para el Key Vault"
  value       = azurerm_subnet.keyvault.id
}

output "subnet_blobstorage_id" {
  description = "ID de la subred para el Blob Storage"
  value       = azurerm_subnet.blobstorage.id
}

output "subnet_appgw_id" {
  description = "ID de la subred para el Application Gateway"
  value       = azurerm_subnet.appgw.id
}

output "subnet_privateend_id" {
  description = "ID de la subred para los Private Endpoints"
  value       = azurerm_subnet.privateend.id
}

# ======================
# Application Gateway
# ======================
output "appgw_public_ip" {
  description = "Dirección IP pública del Application Gateway (usar en GoDaddy)"
  value       = azurerm_public_ip.appgw_ip.ip_address
}

output "appgw_fqdn" {
  description = "FQDN público del Application Gateway"
  value       = azurerm_public_ip.appgw_ip.fqdn
}

output "appgw_id" {
  description = "ID del Application Gateway"
  value       = azurerm_application_gateway.appgw.id
}

# Hostnames usados en Application Gateway
output "appgw_backend_host" {
  description = "Hostname configurado en Application Gateway para el Backend"
  value       = azurerm_linux_web_app.backend.default_hostname
}

output "appgw_frontend_host" {
  description = "Hostname configurado en Application Gateway para el Frontend"
  value       = azurerm_windows_web_app.frontend.default_hostname
}

# ======================
# Key Vault & Storage
# ======================
output "key_vault_name" {
  description = "Nombre del Key Vault desplegado"
  value       = var.key_vault_name
}

output "storage_account_name" {
  description = "Nombre del Storage Account desplegado"
  value       = var.storage_account_name
}

output "storage_account_id" {
  description = "ID del Storage Account desplegado"
  value       = "/subscriptions/${data.azurerm_subscription.primary.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}"
}

# ======================
# Resource Group
# ======================
output "resource_group_name" {
  description = "Nombre del Resource Group donde se desplegaron los recursos"
  value       = var.resource_group_name
}
