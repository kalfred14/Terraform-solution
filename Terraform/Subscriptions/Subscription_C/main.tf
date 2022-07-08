locals {
  sub_name      = "Subscription_C"
  address_space = "10.0.3.0/24"
}

provider "azurerm" {
  features {}
  subscription_id = "008235f6-3e2d-4cab-b303-b0fefcc51847"
}

resource "azurerm_resource_group" "example" {
  name     = local.sub_name
  location = "West Europe"
}

module "Networking" {
  source         = "../../Modules/Networking"
  sub_name       = local.sub_name
  resource_group = azurerm_resource_group.example
  address_space  = local.address_space
}
