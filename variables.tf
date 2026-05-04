variable "vnet_resource" {
  type        = map(object({
    rg_name = string
    vnet_name = string
    snet_name1 = string
    snet_name2 = string
}))
}
