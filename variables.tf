variable "Nested_map_storageAccount" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
  
  description = "Nested map variable for storage account details"
}


variable "Nested_Map_BlobContainer" {
  
}
