variable "nsg_child" {
  description = "this variable use for nsg"
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
  }))
}
