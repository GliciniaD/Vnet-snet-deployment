variable "storage_accounts" {
  type        = map(object({
    rg_name = string
    storage_name = string
}))
}
