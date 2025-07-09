variable "virtual_network_name"{
    type = string 
}

variable "vnet_resource_group" {

    type = string 
}


variable "vnet_location" {

    type = string 
}

variable "vent_address_prefix" {

type = list(string)

}