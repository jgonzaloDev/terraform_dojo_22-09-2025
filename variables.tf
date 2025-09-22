variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnets" {
  type = map(string)
}

variable "sql_server_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "sql_admin_login" {
  type = string
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}

variable "app_service_plan_name" {
  type = string
}

variable "app_service_plan_name_web" {
  type = string
}

variable "app_service_name" {
  type = string
}

variable "app_service_name_web" {
  type = string
}

variable "frontend_zip_path" {
  type = string
}

variable "github_repo_url" {
  type = string
}

variable "github_branch" {
  type = string
}

variable "github_token_secret_name" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "cert_password" {
  type      = string
  sensitive = true
}
