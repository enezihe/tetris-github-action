variable "location" {
  description = "Azure region to use."
  type        = string
  default     = "East US"
}
variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "test1"
}

variable "acr_name" {
  description = "The unique name of the Azure Container Registry."
  default     = "ccseyhan"
}

variable "acr_sku" {
  description = "The SKU name of the the container registry. Possible values are `Classic` (which was previously `Basic`), `Basic`, `Standard` and `Premium`."
  type        = string
  default     = "Standard"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "example"
}

variable "app_service_sku" {
  description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, FREE, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, Y1, EP1, EP2, EP3, WS1, WS2, and WS3."
  type        = string
  default     = "P1v2"
}

variable "web_app_name" {
  description = "Name of the Web App."
  type        = string
  default     = "ccseyhan-webapp"
}

variable "github_repo_name" {
  description = "Name of the Github Repository you are working on"
  type        = string
  default     = "tetris-github_action"
}