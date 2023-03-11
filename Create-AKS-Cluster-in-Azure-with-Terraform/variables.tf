variable "resource_group_location" {
  default = "westus"
}

variable "agent_count" {
  default = 3
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "k8sguru"
}

variable cluster_name {
  default = "k8sguru"
}

variable aks_service_principal_app_id {
  default = "55e62012-0202-42d8-9086-ca4353d32fa4"
}

variable aks_service_principal_client_secret {
  default = "kIo8Q~Oxz7g.GgU5Aj0e0uXp1-4Cn3AbIWRPoasO" 
}
