variable "prefix" {
  description = "The project prefix. Must be unique per project or client"
}

variable "region" {
  description = "The location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table"
}
