# Azure Portal Account:
```
u: cloud_user_p_78c51650@azurelabs.linuxacademy.com
p: 0sNQXAmG%9bMOTpkY9lZ
service_principal: 55e62012-0202-42d8-9086-ca4353d32fa4
secret: kIo8Q~Oxz7g.GgU5Aj0e0uXp1-4Cn3AbIWRPoasO
```
# Setup Up Cloud Shell & Lab Environment
## In the Portal
```
Click the Cloud Shell icon.
Select Bash at the prompt.
Click Show Advanced Settings.
Set the Cloud Shell region to the same location as the resource group.
Select the existing resource group, and select Use Existing for the Storage Account.
In the File share section, choose Create new and enter terraform.
Click Create Storage.
Download the lab_7_setup.sh script at https://raw.githubusercontent.com/ACloudGuru/advanced-terraform-with-azure/main/lab_aks_cluster/lab_7_setup.sh.
Add execute permissions to the script.
Run the lab_7_setup.sh script.
```

## $ cloud [ ~/clouddrive/terraformguru ]$ terraform init
```
Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "~> 2.0"...
- Installing hashicorp/azurerm v2.99.0...
- Installed hashicorp/azurerm v2.99.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## $ cloud [ ~/clouddrive/terraformguru ]$ az group list
```
[
  {
    "id": "/subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/664-29c2715c-create-an-aks-cluster-in-azure-with-t",
    "location": "centralus",
    "managedBy": null,
    "name": "664-29c2715c-create-an-aks-cluster-in-azure-with-t",
    "properties": {
      "provisioningState": "Succeeded"
    },
    "tags": null,
    "type": "Microsoft.Resources/resourceGroups"
  }
]
```

## $ cloud [ ~/clouddrive/terraformguru ]$ terraform import azurerm_resource_group.k8s /subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/664-29c2715c-create-an-aks-cluster-in-azure-with-t
```
Acquiring state lock. This may take a few moments...
azurerm_resource_group.k8s: Importing from ID "/subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/664-29c2715c-create-an-aks-cluster-in-azure-with-t"...
azurerm_resource_group.k8s: Import prepared!
  Prepared azurerm_resource_group for import
azurerm_resource_group.k8s: Refreshing state... [id=/subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/664-29c2715c-create-an-aks-cluster-in-azure-with-t]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

## cloud [ ~/clouddrive/terraformguru ]$ terraform state list
```
azurerm_resource_group.k8s
```

## cloud [ ~/clouddrive/terraformguru ]$ terraform state show azurerm_resource_group.k8s
```
# azurerm_resource_group.k8s:
resource "azurerm_resource_group" "k8s" {
    id       = "/subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/664-29c2715c-create-an-aks-cluster-in-azure-with-t"
    location = "centralus"
    name     = "664-29c2715c-create-an-aks-cluster-in-azure-with-t"
    tags     = {}

    timeouts {}
}
```

## cloud [ ~/clouddrive/terraformguru ]$ ssh-keygen -m PEM -t rsa -b 4096
```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/cloud/.ssh/id_rsa): 
Created directory '/home/cloud/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/cloud/.ssh/id_rsa
Your public key has been saved in /home/cloud/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:sKkqpORm9Gr2dztxrlH2WS5clGXRdoiULD4u+iCSDDw cloud@cc-844461a7-5bf6dc786-dztcq
The key's randomart image is:
+---[RSA 4096]----+
|           o.o =o|
|          . + = +|
|      .  . . o ..|
|.      +  o .    |
|.E    o S+ . o   |
| *.. . .+.+ =    |
|* = o .o+. = .   |
|o* + o.+..  .    |
|=o+.. .+=        |
+----[SHA256]-----+
```

## cloud [ ~/clouddrive/terraformguru ]$ terraform fmt
```
aks.tf
output.tf
providers.tf
variables.tf
```

## cloud [ ~/clouddrive/terraformguru ]$ terraform validate
```
Success! The configuration is valid.
```

## cloud [ ~/clouddrive/terraformguru ]$ terraform plan -out aks.tfplan
```
azurerm_resource_group.k8s: Refreshing state... [id=/subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/664-29c2715c-create-an-aks-cluster-in-azure-with-t]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_kubernetes_cluster.k8s will be created
  + resource "azurerm_kubernetes_cluster" "k8s" {
      + azure_policy_enabled                = (known after apply)
      + dns_prefix                          = "k8sguru"
      + fqdn                                = (known after apply)
      + http_application_routing_enabled    = (known after apply)
      + http_application_routing_zone_name  = (known after apply)
      + id                                  = (known after apply)
      + kube_admin_config                   = (known after apply)
      + kube_admin_config_raw               = (sensitive value)
      + kube_config                         = (known after apply)
      + kube_config_raw                     = (sensitive value)
      + kubernetes_version                  = (known after apply)
      + location                            = "centralus"
      + name                                = "k8sguru"
      + node_resource_group                 = (known after apply)
      + open_service_mesh_enabled           = (known after apply)
      + portal_fqdn                         = (known after apply)
      + private_cluster_enabled             = (known after apply)
      + private_cluster_public_fqdn_enabled = false
      + private_dns_zone_id                 = (known after apply)
      + private_fqdn                        = (known after apply)
      + private_link_enabled                = (known after apply)
      + public_network_access_enabled       = true
      + resource_group_name                 = "664-29c2715c-create-an-aks-cluster-in-azure-with-t"
      + role_based_access_control_enabled   = (known after apply)
      + sku_tier                            = "Free"
      + tags                                = {
          + "Environment" = "Development"
        }

      + aci_connector_linux {
          + subnet_name = (known after apply)
        }

      + addon_profile {
          + aci_connector_linux {
              + enabled     = (known after apply)
              + subnet_name = (known after apply)
            }

          + azure_keyvault_secrets_provider {
              + enabled                  = (known after apply)
              + secret_identity          = (known after apply)
              + secret_rotation_enabled  = (known after apply)
              + secret_rotation_interval = (known after apply)
            }

          + azure_policy {
              + enabled = (known after apply)
            }

          + http_application_routing {
              + enabled                            = (known after apply)
              + http_application_routing_zone_name = (known after apply)
            }

          + ingress_application_gateway {
              + effective_gateway_id                 = (known after apply)
              + enabled                              = (known after apply)
              + gateway_id                           = (known after apply)
              + gateway_name                         = (known after apply)
              + ingress_application_gateway_identity = (known after apply)
              + subnet_cidr                          = (known after apply)
              + subnet_id                            = (known after apply)
            }

          + kube_dashboard {
              + enabled = (known after apply)
            }

          + oms_agent {
              + enabled                    = (known after apply)
              + log_analytics_workspace_id = (known after apply)
              + oms_agent_identity         = (known after apply)
            }

          + open_service_mesh {
              + enabled = (known after apply)
            }
        }

      + auto_scaler_profile {
          + balance_similar_node_groups      = (known after apply)
          + empty_bulk_delete_max            = (known after apply)
          + expander                         = (known after apply)
          + max_graceful_termination_sec     = (known after apply)
          + max_node_provisioning_time       = (known after apply)
          + max_unready_nodes                = (known after apply)
          + max_unready_percentage           = (known after apply)
          + new_pod_scale_up_delay           = (known after apply)
          + scale_down_delay_after_add       = (known after apply)
          + scale_down_delay_after_delete    = (known after apply)
          + scale_down_delay_after_failure   = (known after apply)
          + scale_down_unneeded              = (known after apply)
          + scale_down_unready               = (known after apply)
          + scale_down_utilization_threshold = (known after apply)
          + scan_interval                    = (known after apply)
          + skip_nodes_with_local_storage    = (known after apply)
          + skip_nodes_with_system_pods      = (known after apply)
        }

      + azure_active_directory_role_based_access_control {
          + admin_group_object_ids = (known after apply)
          + azure_rbac_enabled     = (known after apply)
          + client_app_id          = (known after apply)
          + managed                = (known after apply)
          + server_app_id          = (known after apply)
          + server_app_secret      = (sensitive value)
          + tenant_id              = (known after apply)
        }

      + default_node_pool {
          + kubelet_disk_type    = (known after apply)
          + max_pods             = (known after apply)
          + name                 = "agentpool"
          + node_count           = 3
          + node_labels          = (known after apply)
          + orchestrator_version = (known after apply)
          + os_disk_size_gb      = 30
          + os_disk_type         = "Managed"
          + os_sku               = (known after apply)
          + type                 = "VirtualMachineScaleSets"
          + ultra_ssd_enabled    = false
          + vm_size              = "Standard_D2s_v3"
        }

      + ingress_application_gateway {
          + effective_gateway_id                 = (known after apply)
          + gateway_id                           = (known after apply)
          + gateway_name                         = (known after apply)
          + ingress_application_gateway_identity = (known after apply)
          + subnet_cidr                          = (known after apply)
          + subnet_id                            = (known after apply)
        }

      + key_vault_secrets_provider {
          + secret_identity          = (known after apply)
          + secret_rotation_enabled  = (known after apply)
          + secret_rotation_interval = (known after apply)
        }

      + kubelet_identity {
          + client_id                 = (known after apply)
          + object_id                 = (known after apply)
          + user_assigned_identity_id = (known after apply)
        }

      + linux_profile {
          + admin_username = "ubuntu"

          + ssh_key {
              + key_data = <<-EOT
                    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDG5PJCyZXXpl1+rkyHOXXA7hYcSi4SsV0/E1cuMUjoZBaWG4E8Z/4HPSmVxO3U5EQ3p9Qu953QO9KDPsG836HEz4HuvjMR8q0FEAK2nmcEaDlTurrNwrD2E2slYtlj1A5e+93JhEEw3Le+StT6EJ0806NQg+HCZONH9fWKQYuQ0sc1kZhaxbpCk4D16/I/IvW+RrJ8t/zTJC4KkNdfPuJQQx8xobOLNilG0WI1pkNNNoOdOlza9jsgGM8rz414x3r6nsO60NXFV5arvOKtNFxlV3p3KdSQ9eiLefN1LXWBd3TTCHg/OYl9LaQznr/9dAz13N/XYcpv7Jkfeq9powsocZ6kOrjkWsCujCsubKvRYWYeFZYTHL+RN2D3+/d0frQm90LkBHOXFCkHsU5aiDt+gEMHoVdfoje2hke3JeqIJrfnjGEJTpaTuoWqE7wjwYYVPDcW4TFb4AbOWR2+BLXHncZD+i+Xwx0NFD2iJEIhLl72gbELLufWdVC/yGsrap3KpYTcrWrUAg5CxwdAAqbgoj28KPeoNsCk0xCzvB+OHvwuPMOc6yLzCQKObTceYapaz6PHVFOs9nBCawO+phHXSbgqI1YWJNYLveuqqlh042vHCChldDQ+9y1m9yQaVDRFSxOVQknvJwRNr6V0LW9OE8Q7kkeFS1qY3xJQbWhXsQ== cloud@cc-844461a7-5bf6dc786-dztcq
                EOT
            }
        }

      + network_profile {
          + dns_service_ip     = (known after apply)
          + docker_bridge_cidr = (known after apply)
          + load_balancer_sku  = "Standard"
          + network_mode       = (known after apply)
          + network_plugin     = "kubenet"
          + network_policy     = (known after apply)
          + outbound_type      = "loadBalancer"
          + pod_cidr           = (known after apply)
          + service_cidr       = (known after apply)

          + load_balancer_profile {
              + effective_outbound_ips    = (known after apply)
              + idle_timeout_in_minutes   = (known after apply)
              + managed_outbound_ip_count = (known after apply)
              + outbound_ip_address_ids   = (known after apply)
              + outbound_ip_prefix_ids    = (known after apply)
              + outbound_ports_allocated  = (known after apply)
            }

          + nat_gateway_profile {
              + effective_outbound_ips    = (known after apply)
              + idle_timeout_in_minutes   = (known after apply)
              + managed_outbound_ip_count = (known after apply)
            }
        }

      + oms_agent {
          + log_analytics_workspace_id = (known after apply)
          + oms_agent_identity         = (known after apply)
        }

      + role_based_access_control {
          + enabled = (known after apply)

          + azure_active_directory {
              + admin_group_object_ids = (known after apply)
              + azure_rbac_enabled     = (known after apply)
              + client_app_id          = (known after apply)
              + managed                = (known after apply)
              + server_app_id          = (known after apply)
              + server_app_secret      = (sensitive value)
              + tenant_id              = (known after apply)
            }
        }

      + service_principal {
          + client_id     = "55e62012-0202-42d8-9086-ca4353d32fa4"
          + client_secret = (sensitive value)
        }

      + windows_profile {
          + admin_password = (sensitive value)
          + admin_username = (known after apply)
          + license        = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + client_certificate     = (known after apply)
  + client_key             = (known after apply)
  + cluster_ca_certificate = (known after apply)
  + cluster_password       = (known after apply)
  + cluster_username       = (known after apply)
  + host                   = (known after apply)
  + kube_config            = (sensitive value)
  + resource_group_name    = "664-29c2715c-create-an-aks-cluster-in-azure-with-t"

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: aks.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "aks.tfplan"
```

## cloud [ ~/clouddrive/terraformguru ]$ terraform apply aks.tfplan
```
azurerm_kubernetes_cluster.k8s: Creating...
azurerm_kubernetes_cluster.k8s: Still creating... [3m30s elapsed]
azurerm_kubernetes_cluster.k8s: Creation complete after 3m36s [id=/subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/664-29c2715c-create-an-aks-cluster-in-azure-with-t/providers/Microsoft.ContainerService/managedClusters/k8sguru]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

client_certificate = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUZIVENDQXdXZ0F3SUJBZ0lRRzh1TFZHZWNSVU1obUJiUWR4NDRnakFOQmdrcWhraUc5dzBCQVFzRkFEQU4KTVFzd0NRWURWUVFERXdKallUQWVGdzB5TXpBek1URXlNekU0TURaYUZ3MHlOVEF6TVRFeU16STRNRFphTURBeApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1SVXdFd1lEVlFRREV3eHRZWE4wWlhKamJHbGxiblF3CmdnSWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUNEd0F3Z2dJS0FvSUNBUURHdG5jRUNaNS9MeTZFRnpheHVSaFMKRGJtV2VObEUxZlg5UkRNeWFES3NwYmZnWW9IT1k0eWZzZk1aK0xxdkRFYWhxbnE0SlkwbkdjcUhNUGlTS2FtcwppUkw3bmkyTFRFT2d2MUZOUUNXVlFUTDVrbS9ZL2NvT1l5ckJBc1Z1Y3VBdzd4VVdGOXZmMk96bkVGQjFmdnMzClU3U2hPWlZJeFZXUjJCa1k0NGE5UGNyZDF2d3V1VEtpMFZpemlaSXV5SlRnS3NxbzY5cFBtaU5pMERyR0tKaDgKai9Calg3M3pOZmtSS1NpSUZOTmo4aTN3aU9Ub0RLVEhvWGNEWmY4NVBScmdxcnBIbVMxa1hUM0N3d051T05hWApIRFQwTlF4RkY3cFRKMHVjbHBEdjRiVTRpQ2xndTVtZk5EL3pPVUZsVUNFeXRyaUtoRDhXczB3VmpScnpQb01LClRDZW9UOUl1TTlwRm9KMXdBNDVvcFRkM0tvTUgwTmppZ2F0c0VRQWxuaEtTMHBZTmR4MmUrMnlPeGdac2syWkoKQzYzSEhPOVFFK1lsenNyYnM1NDVOL3Q5MnRlOUNtYjRyRWIyWmpoYlBtOVRJZWlyTVhXbEZ2S0VyZWVWbkdUbwppNXB2bWo1VXo4L0l6dDlaQnU2cXYzMVNpUnBURGF6a29xbjZNVitycjBkNVp4ckdvbEFJV2lMTjJPa3RxQTlyClB6WGltaEhHeUQ4VzVVdGpzeEJBQ0pLV3RUVlAzM3hCTyt3cEQvNEFkNlRTb1liUVQycFhJYk9SQmNWQU5xNk8KT3h3QU9LZm5CQUhPU0o4ZVYrSFdPdVdacjFJRGErKzJjOFh4ODh0TWd0cGk0MWJUT2VQWkNVOGJCSkdYRThpdQpFeEZIaW96aFB4YlNsdGMzcWljMTJ3SURBUUFCbzFZd1ZEQU9CZ05WSFE4QkFmOEVCQU1DQmFBd0V3WURWUjBsCkJBd3dDZ1lJS3dZQkJRVUhBd0l3REFZRFZSMFRBUUgvQkFJd0FEQWZCZ05WSFNNRUdEQVdnQlJaTnkzMTBzSTYKWE42Y2Frd3NDQitMVzc3Rmd6QU5CZ2txaGtpRzl3MEJBUXNGQUFPQ0FnRUFCUUJVZWd1bkdTeTdlMjhXeE94LwpRaEtzajNMRjR1VnZSck1Xci9CUkZjN1k0OGtmMmRpenIyWm5DZzBNVElGdXdwbmpDcTgvMXZLd3d1VXFFeDZQCm5pcXlGKzBMcTlzdWtUYWFHdGliTGRxbzQ1SkN3K3ErQTBCZUxSSEgvbENwTVRoU25rWUQrM0FOZzYwNVFDVTkKTE9HT1ZwWUFiL1hQSDA5OXJaYng1S1ZPbmhIZkZHbmNwczRUZzBIZ0hKd3dIdjhqVHAveXVjWG93VWxlQlNtaQo2Y05uQ0VwVTZnbXhSR2VKTDlMMmpRTlZsZy9qYUJlZmZJYUlCN0srYXluUHVrWnVTay9QdkhPVGV2bmFNdUp1Clpvdm1kREZVajdTUzUra3o4WU9UTlIvODhrNUNxVERXc2xaQmdJT1dRM01vSjZpczlpbnlHV1N4T0JndTBETTgKL3U2dkF5Sm9kdGtYSHB1dzlNeUdHcUQ0N3VnMFFxcUgzSTBNSnR4UGFkZ3VHd0lPK1lZUXB5dnJNZ2h0WkN4QQpWZm0xMGxsck5WUzg1MkFsTmp2M25TTitHK29QSWJtUUczZ3M3VHdrVTg5Z3NaWEVPQ0M5T0Uva0R3dm9DNlArCnF5cElEekQ4bnFmTVFsblB0cXlkbG03RmEvcjNKeWpNVmErNkVISEx4ZENrdmdHd3FKRFozVWdxRlY0VlJQeUgKb2JUMUc1QUZwclByc2pWVDNlRFZBdUQ5YythOHptWm5xZXB5VDBERXI0ZUljelFuSm5iYjRFc3F4TFpXOUJ4ZgpsQTA5bEpLUThkT3hxaVBMVGM4ZU1Mdk9TNlJodlNkMzRKM1pVRDhFN0tIU1NBeDEwMkd0VXZWelV3NHgrV1duCm9UajNZRVZsbnBieEhxbWZBNGNsRmJJPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
client_key = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlKSndJQkFBS0NBZ0VBeHJaM0JBbWVmeTh1aEJjMnNia1lVZzI1bG5qWlJOWDEvVVF6TW1neXJLVzM0R0tCCnptT01uN0h6R2ZpNnJ3eEdvYXA2dUNXTkp4bktoekQ0a2ltcHJJa1MrNTR0aTB4RG9MOVJUVUFsbFVFeStaSnYKMlAzS0RtTXF3UUxGYm5MZ01POFZGaGZiMzlqczV4QlFkWDc3TjFPMG9UbVZTTVZWa2RnWkdPT0d2VDNLM2RiOApMcmt5b3RGWXM0bVNMc2lVNENyS3FPdmFUNW9qWXRBNnhpaVlmSS93WTErOTh6WDVFU2tvaUJUVFkvSXQ4SWprCjZBeWt4NkYzQTJYL09UMGE0S3E2UjVrdFpGMDl3c01EYmpqV2x4dzA5RFVNUlJlNlV5ZExuSmFRNytHMU9JZ3AKWUx1Wm56US84emxCWlZBaE1yYTRpb1EvRnJOTUZZMGE4ejZEQ2t3bnFFL1NMalBhUmFDZGNBT09hS1UzZHlxRApCOURZNG9HcmJCRUFKWjRTa3RLV0RYY2RudnRzanNZR2JKTm1TUXV0eHh6dlVCUG1KYzdLMjdPZU9UZjdmZHJYCnZRcG0rS3hHOW1ZNFd6NXZVeUhvcXpGMXBSYnloSzNubFp4azZJdWFiNW8rVk0vUHlNN2ZXUWJ1cXI5OVVva2EKVXcyczVLS3ArakZmcTY5SGVXY2F4cUpRQ0ZvaXpkanBMYWdQYXo4MTRwb1J4c2cvRnVWTFk3TVFRQWlTbHJVMQpUOTk4UVR2c0tRLytBSGVrMHFHRzBFOXFWeUd6a1FYRlFEYXVqanNjQURpbjV3UUJ6a2lmSGxmaDFqcmxtYTlTCkEydnZ0blBGOGZQTFRJTGFZdU5XMHpuajJRbFBHd1NSbHhQSXJoTVJSNHFNNFQ4VzBwYlhONm9uTmRzQ0F3RUEKQVFLQ0FnQWVBN09JWlplT0tHZERSbXBaZjlhL2xoa2hORkhGQnZobjcrUTN5ZXRWanBadWl4S0dSUjBaaGZ4dApRTmVaMXlYWUIzTVAyNFF0a3NTM2xOc0c0TW9qS0hVNGtsVFl4SVUyZzQ5Wk5zWTJmQ21oN3M5OEhDRm4rT3lkClNMamZqUFIyRDdiRXBvZnNrTXgvdmtRWTZ6d3d5RER4WlV3Nk9LeExJalB3UVhXNW9kckJsVlowREQ4c3ZxaEMKUGhaWmdLeVVDNEtlN3prRGF3bkxSQjZNamRjeWdWOVM4MFF5dDBWT3BVUGRBaUJINlcyczlsQjFDR3ZmUjNFOQpqeXQwenRqL2RHbzhwRk5wNUhlT3Nud1RLdnlteUhqckpoUWJYNUVpUEQ0OGdiV1V0aWYwU1FUTytxY2lsL2JNCjJ5b1lqbmpsT3hvMnVmRDVrYzE5TjlvSlFianpFaGoyUEZvcTVXeEs1bUJRdkR6dWxJZFJFTmw4eWNyQUNKcjEKVmRiVXhvTFl5a0RDa05pWHY5OGRRL0NvSm1ITng3SG9QT0hvOUNZTS9hQ2o4V3dQMExtVDZuQlZmMlpNbW5jMQo3WEVBUGRrMzZ1SmRKMTNCUEZoTjBjT0pQaThvbC9zZnNvcnIyRnc1VFo5WHpkZ3FNaVlEWkFZZEd3a1NoY3VECmlXOUdZNTVZWTJTRngzOHFQM1gwUE14WjhZN2dGb05yaHRRT3YrQmxIQi9WU21GVlBVTlZ2Z3l3TlBSVjA4NEkKQ3FLVjhZMFBHQWQvTXpWempYZjh6Y3F0Njgwa0pOeHJFNkNDUW92aWhIZ3h3ZnBQZ0h4bVQ2a3F0OVNJekFoTwoyYmYwRW9nVGZKQzVvZk5TVnV5Y2M4L1gwMlBRdURiOEpPVE9HVDNuVzZSNk15SGZxUUtDQVFFQTRhN0poUVBOCm8vSnhPeUxYdkJJR1FhQzNOUW9uR3JmSVByZnZGSVBabFMxbys3Y2RYOHpVM0IreTVsb08xUFI3VGx1d2NVNHgKQ3BCdi9LT1R0VTVDUWpRcFI3eW02SmRMazZ4T3BDaU9ISXZKK2Rzdnhueis5YW5NTkNvR1NTOTUxNm92M3h1WQpoT2xNSnZKTHpZSEVWb0E5THZwUXJTMDk1L1FEYjF1ZlhNYjlqb2tTSXdLK29mUm0ybWFKNDY3RmswN3lRSGJBCkNyWllraE56czZrMk42dmxsaVNYaVF4L3V4K0hzR2dES1V4STE1UTluYjR3emhGemhFS3NRckwvbDFQY2pKNkEKU1o1V2JCS3B3UzBWdGFiRmF3Vjd4VWdvZDRjQkFCZDNHQWtJUFFYcGpheHF5YUs4bTVqdWxwNjlnRVZvVVYwKwpPUko1cm9ITVEvNkl4UUtDQVFFQTRXZ3VZb1g4T3pTTkx1ZjhIWEcxVnY5RDh6dmF6dEFWZm02ZGErUXFZV2JtCnVobFdUZ0lHMjdQY1NUMmdUMFM1TVY0eGZuSXYrVm83ZXRzSEZJYnA0VHdUdlh4Z3Y1OGIxdi9ETGc5WUVBaGUKUUFUS3NIMFJqZ3JVbkZ3QzRVNDlNM0VGS2Z5VWlXRVQ1VzdkSkx5N2hpNDBxME94dzRROWVrb2oxZFNTVDloVgpoc1hDVzc2RDBEb1pjVjdhd0JiWk0rczdGUndwaG45dkRBektUL2hJNEVZUlhlV2FVbkNkYkZJbjNEaDhmT1ZjCmxNbWFXMGQ2YmV1TjA2aVo4TCtXSTdQZG80TmtOOVpreXVzMGVXM3VnY2hXb2F2ZXphV01EcFFvS2prVGNodFgKcjFZTjFjYlMwUXBXc1VXRzZrRngyazlyS1ZXZ2lpUkwxV0cxS2xCdUh3S0NBUUExL0RhdWYrdG9KVzJhcE1vUQpiZ3RiRlpQZHR6RUZmaU1EaGNKR0dRZ3FYRE41eXlMV3NNdldZQ3JPV1lxa3ZGcm1zcDR4Ykcva3hBcFYxOWRVCmpvVGhDMU00bXRNZVhscXcxNDMwVE5NNTF1S1l4eXJWZ3o4R0N2a1RIVjVsa1ZySEVTbmtaOWlES3IrUnJYSWUKbGNVZW9BeUN1VlFsS09aZkh3clhUNForamdkSFdsaWhVVjNDcGhFWWUyRE91eGIrRnV0eUtqWGtHaHh6elAxbgpZN25aZFdBMUcwbTRlZW53SENtOE5CVlZncThHQ3FyMm1mRll5ZW5sSUlIT2JyMGZPT3RRSS9ZeUpoTXNSUWFnCmRDVjJUNDkzKzFiUktXS3N2UG1yU1BHdktUSDBUdjdBYWhjZFpyVlJUekw3aXJ0di9LcG9sREozT29rckNsZVAKaUVxMUFvSUJBSHkrT0RWa0t4UGs0R0ZlRjBPQVF6Z3pLcnE0bkQ0cUlFc0pFbXU4S013Z3MzMjRPZkFQNVJXLwpjeURCVHkrdk84SWJlODZiaVBzNU9ZT2pKVWJ4NXdzMFFVUnpTZU9pUFRqOThGbFVPb3NjNW5RTmN0SzdWSFRFCmY2ZE1zSGRaNGpyT3lHblZFNnIzbzVnc2c0d3FPcWxtZHRWMU1ES2d3NWtpNExRYzRSLzQvRlFLcTZZMFNDUjcKa3NzUUVJV1AzNEtCSXdCcXhueGRsK29XUmZ4OXptNzN0L0s3OTJ5NlVCUzdYcjNjTU9DNTJrT3BVcGhEZFhqUgpqSHJmYXRvMlhQUERQZHlaQVdSNWJPeHp3R1dYTmhCeSs2YWJSRUdRNVhMSUFYWmtnZU43U0VxTG1EcC92dm5hCisrRTlOZzM4Uy9MaVVzN2NTVzFKNndIYkFmUzU4RWNDZ2dFQUYzQWJuMTlONGM0YmpRWGR0amk3aFFuZ3E1L0QKNStSSzVoc3oydmVleTVkMHlFNStCL2FDRDljZ0h0bk4vVU1EbTRXTnVpS1MvV2VhcisvSTJSVkVqMzRmdFFzZAp1TUFlQzFPeWlacXlvaG1VRC9BOHljSUc0NjQzOTRqVlIxdWlWT2JFdDIrSXdhZGMwQWVlQURJbWFMQi9kc0pXCnFMV3VuVjNPVGZWTWV6ckVKNVkyWGRRcHRHRlpUM0lrdk9PWlNvd0hxWk5YMWZFbkZiQW00cGlCUk5lVEk4a1QKL0lIelB1L1R5Q2l0K3ZqRUs1TzlCcFBQUmFXanN4WFZwY2NVRFIvNndxWnh5V2p5ZURYOWVZZ3R3Qjl1T016VQpqMUNINlYwT2FReUtwazF2S0xUOHNjRkVuOC9CNU9GMTBaZkRHTFI0NUJGejZENCs0M1dROXR0K0NnPT0KLS0tLS1FTkQgUlNBIFBSSVZBVEUgS0VZLS0tLS0K"
cluster_ca_certificate = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUU2RENDQXRDZ0F3SUJBZ0lRRFNrOHJibFpId0pIZ2Rrdm1ERkhvekFOQmdrcWhraUc5dzBCQVFzRkFEQU4KTVFzd0NRWURWUVFERXdKallUQWdGdzB5TXpBek1URXlNekU0TURaYUdBOHlNRFV6TURNeE1USXpNamd3TmxvdwpEVEVMTUFrR0ExVUVBeE1DWTJFd2dnSWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUNEd0F3Z2dJS0FvSUNBUUN0CjdhbGtSSEhKYkg1NE83K1dBanRrazMrc3VsYzRScEg1YlBlekpMaFRNRC84b3c3VnMzRUs0VkI2OHEvZUtwcVUKdUtUdHlFTkVSZ0JOSFM3UHV0V0plM3Mza3BHL2tOeUh5TGRwRkQrODdZU3k2YUlmSkJJYmozdXVkb2E2QTZmeQpmcWhkTEhwdDJXdERkd3ZSOXVSdE9PWVpUZ0YzTC9WSm9XN1pHTk96Vk5EaCtCNHl2dGRITXdEbjlSTndGSTlDCkczSlUrT2FWUzNoNFZld1dBZElpajZXSDVJcURRM0EvMmV1NFhqckpFMHBselliZGM3T0V1K2x3N3lFM2IvY0cKcXE0Q3plUlBUS1V2bXRnaC94Vk1yMjl0Tm1lWHFEZzA4WkI5WExLaHB3OWdjNFNTT1h5OWhwSGJQZm5ESXh6MwpiNjRMK3oxYnlneExQU0dDdmxxVGpReVFoWlI4OXl5S1MvNy9JM3dkNTdNd0pyb2h4dXljeGt5cmZWa204UVkvCmp0WUZjQlpiUVpHRUY0S2JYSU5sQ2pQRjdzb0NmeXJhMEZRUkZVRUh3WVNNcFpKRng4MUVQaFlBUmRNUlJVWloKckYvZDgydTNSV3NROE1sazVmY0liMVJJdlNjTG11MmdSSzBvRjhBMkRtNGYxVWlIZE9kdUdvTU81SlVXSlVTKwpGeldKTlJtbjlLcFU3Q3IyVzZhMGlBRHUvWGo0QlVDNEdBeUFUdXlXeGVXTVQwSHprZTg0VDAzeGRKc1E4V3JRCkhnV1V4LytRelBxcXNNMWVpM08wLzlLS3ZHUi9VbCtqTGY3a2crUHJBV1hQRDdqdVk0azRQVEdGMDkzRnJ0M0oKeXpmU0V3VVJYcko1K0NCRyt0NEFsQ0l4U1FwYUYyN1BuM1U0RWx6ZWh3SURBUUFCbzBJd1FEQU9CZ05WSFE4QgpBZjhFQkFNQ0FxUXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QWRCZ05WSFE0RUZnUVVXVGN0OWRMQ09semVuR3BNCkxBZ2ZpMXUreFlNd0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dJQkFLR2VueW0xdng2RENJeGZtRlJ2dkYyMGlzL3kKeFlRUG5ISDcwbHNTNThvSjlwZkE1VGREVlMyN25MUU8yTkw5eC9SS2gxNk1FbDNPb3RoWXVIQ0F1UDZmR2hLcQpueitPWURtMUhzVW5kOGFrVHFUNkZvWFNoRDVGbnRBMjRLZjJZOTFCNlR2bGtublJOQmN1K2JMVWs2ZHMwMUhBCjYxaDRSa0V2NjFqWmxwTGNUVkpLTmNxYmNVamZtbzAyYlNhc2RhN01hNGEzSUFSbUNNT2RkUmZyTHkzdXpoT3kKREFUR1BzemZuL2hOcWhuUS91OW41REdFVi9DVmtzdUk5ZFZOVGxISzdaRmd6dmIvbDZCbXNaWGN5aDhndzVyMwpaUFJuZWk3ZnpvZUh6Q0lmYURLVkZYc0xOdU1Ta0hXeDFEOGtKQ25XTTByTUZyNU9hQkR5REQzcktONG03cFBVCjBFTW5QamtvR3lnNkVFMHR1Y1N0QkNlSVRwaHR0L0wyRjhVQ0JDZytXZUpYa3dhaVAwVnVtRVhnL21Ma2htTWQKUG1MczJDY0pvTnJrY2lFK2xuc1JsQSsra3JMUGdoaXh2QjRyUTJWY1drY1ZQdy9wT3loOXpaNmM0VkdlMU9YSwpocDhyUEhvRkFrbzlYWG5kRzVNaXg0TnEvckM2TVhNL2ZLaWZhS2ZhNGdBR3RlNHp1U3pBRkxTYjdERWYwZVdOCnVpb3FKTGZXVVVpNi9BeUh0eEZlNHBCOUkrd3pISXYwbGIrejBlSytOaWYzTm9ockE5NStudE9NSi9Dd3NpZWEKd1VSVk9SdFhmaXg3dEJQR1cyRGxJdDA1bVJGUVVlZGcxMExUekx0Y3F5Z3MzcThZcGx0d2FveTdQUHNzYmwxawo0TE91eCtkZVRZcGg1WEdGCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
cluster_password = "a62gp1mgz7jjq1o3qe11m9khgl89qeb7jygy164hfumtx3qzkshtwg2okvwbb0mh88wrzoilp39rl5aaganv3fh3gazwdb67sqzi1ostukksgfkiqjrdx7lgft42i3pu"
cluster_username = "clusterUser_664-29c2715c-create-an-aks-cluster-in-azure-with-t_k8sguru"
host = "https://k8sguru-87crkfmm.hcp.centralus.azmk8s.io:443"
kube_config = <sensitive>
resource_group_name = "664-29c2715c-create-an-aks-cluster-in-azure-with-t"
```

## 

## cloud [ ~/clouddrive/terraformguru ]$ terraform output kube_config
```
<<EOT
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUU2RENDQXRDZ0F3SUJBZ0lRRFNrOHJibFpId0pIZ2Rrdm1ERkhvekFOQmdrcWhraUc5dzBCQVFzRkFEQU4KTVFzd0NRWURWUVFERXdKallUQWdGdzB5TXpBek1URXlNekU0TURaYUdBOHlNRFV6TURNeE1USXpNamd3TmxvdwpEVEVMTUFrR0ExVUVBeE1DWTJFd2dnSWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUNEd0F3Z2dJS0FvSUNBUUN0CjdhbGtSSEhKYkg1NE83K1dBanRrazMrc3VsYzRScEg1YlBlekpMaFRNRC84b3c3VnMzRUs0VkI2OHEvZUtwcVUKdUtUdHlFTkVSZ0JOSFM3UHV0V0plM3Mza3BHL2tOeUh5TGRwRkQrODdZU3k2YUlmSkJJYmozdXVkb2E2QTZmeQpmcWhkTEhwdDJXdERkd3ZSOXVSdE9PWVpUZ0YzTC9WSm9XN1pHTk96Vk5EaCtCNHl2dGRITXdEbjlSTndGSTlDCkczSlUrT2FWUzNoNFZld1dBZElpajZXSDVJcURRM0EvMmV1NFhqckpFMHBselliZGM3T0V1K2x3N3lFM2IvY0cKcXE0Q3plUlBUS1V2bXRnaC94Vk1yMjl0Tm1lWHFEZzA4WkI5WExLaHB3OWdjNFNTT1h5OWhwSGJQZm5ESXh6MwpiNjRMK3oxYnlneExQU0dDdmxxVGpReVFoWlI4OXl5S1MvNy9JM3dkNTdNd0pyb2h4dXljeGt5cmZWa204UVkvCmp0WUZjQlpiUVpHRUY0S2JYSU5sQ2pQRjdzb0NmeXJhMEZRUkZVRUh3WVNNcFpKRng4MUVQaFlBUmRNUlJVWloKckYvZDgydTNSV3NROE1sazVmY0liMVJJdlNjTG11MmdSSzBvRjhBMkRtNGYxVWlIZE9kdUdvTU81SlVXSlVTKwpGeldKTlJtbjlLcFU3Q3IyVzZhMGlBRHUvWGo0QlVDNEdBeUFUdXlXeGVXTVQwSHprZTg0VDAzeGRKc1E4V3JRCkhnV1V4LytRelBxcXNNMWVpM08wLzlLS3ZHUi9VbCtqTGY3a2crUHJBV1hQRDdqdVk0azRQVEdGMDkzRnJ0M0oKeXpmU0V3VVJYcko1K0NCRyt0NEFsQ0l4U1FwYUYyN1BuM1U0RWx6ZWh3SURBUUFCbzBJd1FEQU9CZ05WSFE4QgpBZjhFQkFNQ0FxUXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QWRCZ05WSFE0RUZnUVVXVGN0OWRMQ09semVuR3BNCkxBZ2ZpMXUreFlNd0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dJQkFLR2VueW0xdng2RENJeGZtRlJ2dkYyMGlzL3kKeFlRUG5ISDcwbHNTNThvSjlwZkE1VGREVlMyN25MUU8yTkw5eC9SS2gxNk1FbDNPb3RoWXVIQ0F1UDZmR2hLcQpueitPWURtMUhzVW5kOGFrVHFUNkZvWFNoRDVGbnRBMjRLZjJZOTFCNlR2bGtublJOQmN1K2JMVWs2ZHMwMUhBCjYxaDRSa0V2NjFqWmxwTGNUVkpLTmNxYmNVamZtbzAyYlNhc2RhN01hNGEzSUFSbUNNT2RkUmZyTHkzdXpoT3kKREFUR1BzemZuL2hOcWhuUS91OW41REdFVi9DVmtzdUk5ZFZOVGxISzdaRmd6dmIvbDZCbXNaWGN5aDhndzVyMwpaUFJuZWk3ZnpvZUh6Q0lmYURLVkZYc0xOdU1Ta0hXeDFEOGtKQ25XTTByTUZyNU9hQkR5REQzcktONG03cFBVCjBFTW5QamtvR3lnNkVFMHR1Y1N0QkNlSVRwaHR0L0wyRjhVQ0JDZytXZUpYa3dhaVAwVnVtRVhnL21Ma2htTWQKUG1MczJDY0pvTnJrY2lFK2xuc1JsQSsra3JMUGdoaXh2QjRyUTJWY1drY1ZQdy9wT3loOXpaNmM0VkdlMU9YSwpocDhyUEhvRkFrbzlYWG5kRzVNaXg0TnEvckM2TVhNL2ZLaWZhS2ZhNGdBR3RlNHp1U3pBRkxTYjdERWYwZVdOCnVpb3FKTGZXVVVpNi9BeUh0eEZlNHBCOUkrd3pISXYwbGIrejBlSytOaWYzTm9ockE5NStudE9NSi9Dd3NpZWEKd1VSVk9SdFhmaXg3dEJQR1cyRGxJdDA1bVJGUVVlZGcxMExUekx0Y3F5Z3MzcThZcGx0d2FveTdQUHNzYmwxawo0TE91eCtkZVRZcGg1WEdGCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    server: https://k8sguru-87crkfmm.hcp.centralus.azmk8s.io:443
  name: k8sguru
contexts:
- context:
    cluster: k8sguru
    user: clusterUser_664-29c2715c-create-an-aks-cluster-in-azure-with-t_k8sguru
  name: k8sguru
current-context: k8sguru
kind: Config
preferences: {}
users:
- name: clusterUser_664-29c2715c-create-an-aks-cluster-in-azure-with-t_k8sguru
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUZIVENDQXdXZ0F3SUJBZ0lRRzh1TFZHZWNSVU1obUJiUWR4NDRnakFOQmdrcWhraUc5dzBCQVFzRkFEQU4KTVFzd0NRWURWUVFERXdKallUQWVGdzB5TXpBek1URXlNekU0TURaYUZ3MHlOVEF6TVRFeU16STRNRFphTURBeApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1SVXdFd1lEVlFRREV3eHRZWE4wWlhKamJHbGxiblF3CmdnSWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUNEd0F3Z2dJS0FvSUNBUURHdG5jRUNaNS9MeTZFRnpheHVSaFMKRGJtV2VObEUxZlg5UkRNeWFES3NwYmZnWW9IT1k0eWZzZk1aK0xxdkRFYWhxbnE0SlkwbkdjcUhNUGlTS2FtcwppUkw3bmkyTFRFT2d2MUZOUUNXVlFUTDVrbS9ZL2NvT1l5ckJBc1Z1Y3VBdzd4VVdGOXZmMk96bkVGQjFmdnMzClU3U2hPWlZJeFZXUjJCa1k0NGE5UGNyZDF2d3V1VEtpMFZpemlaSXV5SlRnS3NxbzY5cFBtaU5pMERyR0tKaDgKai9Calg3M3pOZmtSS1NpSUZOTmo4aTN3aU9Ub0RLVEhvWGNEWmY4NVBScmdxcnBIbVMxa1hUM0N3d051T05hWApIRFQwTlF4RkY3cFRKMHVjbHBEdjRiVTRpQ2xndTVtZk5EL3pPVUZsVUNFeXRyaUtoRDhXczB3VmpScnpQb01LClRDZW9UOUl1TTlwRm9KMXdBNDVvcFRkM0tvTUgwTmppZ2F0c0VRQWxuaEtTMHBZTmR4MmUrMnlPeGdac2syWkoKQzYzSEhPOVFFK1lsenNyYnM1NDVOL3Q5MnRlOUNtYjRyRWIyWmpoYlBtOVRJZWlyTVhXbEZ2S0VyZWVWbkdUbwppNXB2bWo1VXo4L0l6dDlaQnU2cXYzMVNpUnBURGF6a29xbjZNVitycjBkNVp4ckdvbEFJV2lMTjJPa3RxQTlyClB6WGltaEhHeUQ4VzVVdGpzeEJBQ0pLV3RUVlAzM3hCTyt3cEQvNEFkNlRTb1liUVQycFhJYk9SQmNWQU5xNk8KT3h3QU9LZm5CQUhPU0o4ZVYrSFdPdVdacjFJRGErKzJjOFh4ODh0TWd0cGk0MWJUT2VQWkNVOGJCSkdYRThpdQpFeEZIaW96aFB4YlNsdGMzcWljMTJ3SURBUUFCbzFZd1ZEQU9CZ05WSFE4QkFmOEVCQU1DQmFBd0V3WURWUjBsCkJBd3dDZ1lJS3dZQkJRVUhBd0l3REFZRFZSMFRBUUgvQkFJd0FEQWZCZ05WSFNNRUdEQVdnQlJaTnkzMTBzSTYKWE42Y2Frd3NDQitMVzc3Rmd6QU5CZ2txaGtpRzl3MEJBUXNGQUFPQ0FnRUFCUUJVZWd1bkdTeTdlMjhXeE94LwpRaEtzajNMRjR1VnZSck1Xci9CUkZjN1k0OGtmMmRpenIyWm5DZzBNVElGdXdwbmpDcTgvMXZLd3d1VXFFeDZQCm5pcXlGKzBMcTlzdWtUYWFHdGliTGRxbzQ1SkN3K3ErQTBCZUxSSEgvbENwTVRoU25rWUQrM0FOZzYwNVFDVTkKTE9HT1ZwWUFiL1hQSDA5OXJaYng1S1ZPbmhIZkZHbmNwczRUZzBIZ0hKd3dIdjhqVHAveXVjWG93VWxlQlNtaQo2Y05uQ0VwVTZnbXhSR2VKTDlMMmpRTlZsZy9qYUJlZmZJYUlCN0srYXluUHVrWnVTay9QdkhPVGV2bmFNdUp1Clpvdm1kREZVajdTUzUra3o4WU9UTlIvODhrNUNxVERXc2xaQmdJT1dRM01vSjZpczlpbnlHV1N4T0JndTBETTgKL3U2dkF5Sm9kdGtYSHB1dzlNeUdHcUQ0N3VnMFFxcUgzSTBNSnR4UGFkZ3VHd0lPK1lZUXB5dnJNZ2h0WkN4QQpWZm0xMGxsck5WUzg1MkFsTmp2M25TTitHK29QSWJtUUczZ3M3VHdrVTg5Z3NaWEVPQ0M5T0Uva0R3dm9DNlArCnF5cElEekQ4bnFmTVFsblB0cXlkbG03RmEvcjNKeWpNVmErNkVISEx4ZENrdmdHd3FKRFozVWdxRlY0VlJQeUgKb2JUMUc1QUZwclByc2pWVDNlRFZBdUQ5YythOHptWm5xZXB5VDBERXI0ZUljelFuSm5iYjRFc3F4TFpXOUJ4ZgpsQTA5bEpLUThkT3hxaVBMVGM4ZU1Mdk9TNlJodlNkMzRKM1pVRDhFN0tIU1NBeDEwMkd0VXZWelV3NHgrV1duCm9UajNZRVZsbnBieEhxbWZBNGNsRmJJPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlKSndJQkFBS0NBZ0VBeHJaM0JBbWVmeTh1aEJjMnNia1lVZzI1bG5qWlJOWDEvVVF6TW1neXJLVzM0R0tCCnptT01uN0h6R2ZpNnJ3eEdvYXA2dUNXTkp4bktoekQ0a2ltcHJJa1MrNTR0aTB4RG9MOVJUVUFsbFVFeStaSnYKMlAzS0RtTXF3UUxGYm5MZ01POFZGaGZiMzlqczV4QlFkWDc3TjFPMG9UbVZTTVZWa2RnWkdPT0d2VDNLM2RiOApMcmt5b3RGWXM0bVNMc2lVNENyS3FPdmFUNW9qWXRBNnhpaVlmSS93WTErOTh6WDVFU2tvaUJUVFkvSXQ4SWprCjZBeWt4NkYzQTJYL09UMGE0S3E2UjVrdFpGMDl3c01EYmpqV2x4dzA5RFVNUlJlNlV5ZExuSmFRNytHMU9JZ3AKWUx1Wm56US84emxCWlZBaE1yYTRpb1EvRnJOTUZZMGE4ejZEQ2t3bnFFL1NMalBhUmFDZGNBT09hS1UzZHlxRApCOURZNG9HcmJCRUFKWjRTa3RLV0RYY2RudnRzanNZR2JKTm1TUXV0eHh6dlVCUG1KYzdLMjdPZU9UZjdmZHJYCnZRcG0rS3hHOW1ZNFd6NXZVeUhvcXpGMXBSYnloSzNubFp4azZJdWFiNW8rVk0vUHlNN2ZXUWJ1cXI5OVVva2EKVXcyczVLS3ArakZmcTY5SGVXY2F4cUpRQ0ZvaXpkanBMYWdQYXo4MTRwb1J4c2cvRnVWTFk3TVFRQWlTbHJVMQpUOTk4UVR2c0tRLytBSGVrMHFHRzBFOXFWeUd6a1FYRlFEYXVqanNjQURpbjV3UUJ6a2lmSGxmaDFqcmxtYTlTCkEydnZ0blBGOGZQTFRJTGFZdU5XMHpuajJRbFBHd1NSbHhQSXJoTVJSNHFNNFQ4VzBwYlhONm9uTmRzQ0F3RUEKQVFLQ0FnQWVBN09JWlplT0tHZERSbXBaZjlhL2xoa2hORkhGQnZobjcrUTN5ZXRWanBadWl4S0dSUjBaaGZ4dApRTmVaMXlYWUIzTVAyNFF0a3NTM2xOc0c0TW9qS0hVNGtsVFl4SVUyZzQ5Wk5zWTJmQ21oN3M5OEhDRm4rT3lkClNMamZqUFIyRDdiRXBvZnNrTXgvdmtRWTZ6d3d5RER4WlV3Nk9LeExJalB3UVhXNW9kckJsVlowREQ4c3ZxaEMKUGhaWmdLeVVDNEtlN3prRGF3bkxSQjZNamRjeWdWOVM4MFF5dDBWT3BVUGRBaUJINlcyczlsQjFDR3ZmUjNFOQpqeXQwenRqL2RHbzhwRk5wNUhlT3Nud1RLdnlteUhqckpoUWJYNUVpUEQ0OGdiV1V0aWYwU1FUTytxY2lsL2JNCjJ5b1lqbmpsT3hvMnVmRDVrYzE5TjlvSlFianpFaGoyUEZvcTVXeEs1bUJRdkR6dWxJZFJFTmw4eWNyQUNKcjEKVmRiVXhvTFl5a0RDa05pWHY5OGRRL0NvSm1ITng3SG9QT0hvOUNZTS9hQ2o4V3dQMExtVDZuQlZmMlpNbW5jMQo3WEVBUGRrMzZ1SmRKMTNCUEZoTjBjT0pQaThvbC9zZnNvcnIyRnc1VFo5WHpkZ3FNaVlEWkFZZEd3a1NoY3VECmlXOUdZNTVZWTJTRngzOHFQM1gwUE14WjhZN2dGb05yaHRRT3YrQmxIQi9WU21GVlBVTlZ2Z3l3TlBSVjA4NEkKQ3FLVjhZMFBHQWQvTXpWempYZjh6Y3F0Njgwa0pOeHJFNkNDUW92aWhIZ3h3ZnBQZ0h4bVQ2a3F0OVNJekFoTwoyYmYwRW9nVGZKQzVvZk5TVnV5Y2M4L1gwMlBRdURiOEpPVE9HVDNuVzZSNk15SGZxUUtDQVFFQTRhN0poUVBOCm8vSnhPeUxYdkJJR1FhQzNOUW9uR3JmSVByZnZGSVBabFMxbys3Y2RYOHpVM0IreTVsb08xUFI3VGx1d2NVNHgKQ3BCdi9LT1R0VTVDUWpRcFI3eW02SmRMazZ4T3BDaU9ISXZKK2Rzdnhueis5YW5NTkNvR1NTOTUxNm92M3h1WQpoT2xNSnZKTHpZSEVWb0E5THZwUXJTMDk1L1FEYjF1ZlhNYjlqb2tTSXdLK29mUm0ybWFKNDY3RmswN3lRSGJBCkNyWllraE56czZrMk42dmxsaVNYaVF4L3V4K0hzR2dES1V4STE1UTluYjR3emhGemhFS3NRckwvbDFQY2pKNkEKU1o1V2JCS3B3UzBWdGFiRmF3Vjd4VWdvZDRjQkFCZDNHQWtJUFFYcGpheHF5YUs4bTVqdWxwNjlnRVZvVVYwKwpPUko1cm9ITVEvNkl4UUtDQVFFQTRXZ3VZb1g4T3pTTkx1ZjhIWEcxVnY5RDh6dmF6dEFWZm02ZGErUXFZV2JtCnVobFdUZ0lHMjdQY1NUMmdUMFM1TVY0eGZuSXYrVm83ZXRzSEZJYnA0VHdUdlh4Z3Y1OGIxdi9ETGc5WUVBaGUKUUFUS3NIMFJqZ3JVbkZ3QzRVNDlNM0VGS2Z5VWlXRVQ1VzdkSkx5N2hpNDBxME94dzRROWVrb2oxZFNTVDloVgpoc1hDVzc2RDBEb1pjVjdhd0JiWk0rczdGUndwaG45dkRBektUL2hJNEVZUlhlV2FVbkNkYkZJbjNEaDhmT1ZjCmxNbWFXMGQ2YmV1TjA2aVo4TCtXSTdQZG80TmtOOVpreXVzMGVXM3VnY2hXb2F2ZXphV01EcFFvS2prVGNodFgKcjFZTjFjYlMwUXBXc1VXRzZrRngyazlyS1ZXZ2lpUkwxV0cxS2xCdUh3S0NBUUExL0RhdWYrdG9KVzJhcE1vUQpiZ3RiRlpQZHR6RUZmaU1EaGNKR0dRZ3FYRE41eXlMV3NNdldZQ3JPV1lxa3ZGcm1zcDR4Ykcva3hBcFYxOWRVCmpvVGhDMU00bXRNZVhscXcxNDMwVE5NNTF1S1l4eXJWZ3o4R0N2a1RIVjVsa1ZySEVTbmtaOWlES3IrUnJYSWUKbGNVZW9BeUN1VlFsS09aZkh3clhUNForamdkSFdsaWhVVjNDcGhFWWUyRE91eGIrRnV0eUtqWGtHaHh6elAxbgpZN25aZFdBMUcwbTRlZW53SENtOE5CVlZncThHQ3FyMm1mRll5ZW5sSUlIT2JyMGZPT3RRSS9ZeUpoTXNSUWFnCmRDVjJUNDkzKzFiUktXS3N2UG1yU1BHdktUSDBUdjdBYWhjZFpyVlJUekw3aXJ0di9LcG9sREozT29rckNsZVAKaUVxMUFvSUJBSHkrT0RWa0t4UGs0R0ZlRjBPQVF6Z3pLcnE0bkQ0cUlFc0pFbXU4S013Z3MzMjRPZkFQNVJXLwpjeURCVHkrdk84SWJlODZiaVBzNU9ZT2pKVWJ4NXdzMFFVUnpTZU9pUFRqOThGbFVPb3NjNW5RTmN0SzdWSFRFCmY2ZE1zSGRaNGpyT3lHblZFNnIzbzVnc2c0d3FPcWxtZHRWMU1ES2d3NWtpNExRYzRSLzQvRlFLcTZZMFNDUjcKa3NzUUVJV1AzNEtCSXdCcXhueGRsK29XUmZ4OXptNzN0L0s3OTJ5NlVCUzdYcjNjTU9DNTJrT3BVcGhEZFhqUgpqSHJmYXRvMlhQUERQZHlaQVdSNWJPeHp3R1dYTmhCeSs2YWJSRUdRNVhMSUFYWmtnZU43U0VxTG1EcC92dm5hCisrRTlOZzM4Uy9MaVVzN2NTVzFKNndIYkFmUzU4RWNDZ2dFQUYzQWJuMTlONGM0YmpRWGR0amk3aFFuZ3E1L0QKNStSSzVoc3oydmVleTVkMHlFNStCL2FDRDljZ0h0bk4vVU1EbTRXTnVpS1MvV2VhcisvSTJSVkVqMzRmdFFzZAp1TUFlQzFPeWlacXlvaG1VRC9BOHljSUc0NjQzOTRqVlIxdWlWT2JFdDIrSXdhZGMwQWVlQURJbWFMQi9kc0pXCnFMV3VuVjNPVGZWTWV6ckVKNVkyWGRRcHRHRlpUM0lrdk9PWlNvd0hxWk5YMWZFbkZiQW00cGlCUk5lVEk4a1QKL0lIelB1L1R5Q2l0K3ZqRUs1TzlCcFBQUmFXanN4WFZwY2NVRFIvNndxWnh5V2p5ZURYOWVZZ3R3Qjl1T016VQpqMUNINlYwT2FReUtwazF2S0xUOHNjRkVuOC9CNU9GMTBaZkRHTFI0NUJGejZENCs0M1dROXR0K0NnPT0KLS0tLS1FTkQgUlNBIFBSSVZBVEUgS0VZLS0tLS0K
    token: a62gp1mgz7jjq1o3qe11m9khgl89qeb7jygy164hfumtx3qzkshtwg2okvwbb0mh88wrzoilp39rl5aaganv3fh3gazwdb67sqzi1ostukksgfkiqjrdx7lgft42i3pu

EOT
```

## cloud [ ~/clouddrive/terraformguru ]$ echo "$(terraform output kube_config)" > ./azurek8s

## cloud [ ~/clouddrive/terraformguru ]$ export KUBECONFIG=./azurek8s

## cloud [ ~/clouddrive/terraformguru ]$ kubectl get nodes -o wide -A
```
NAME                                STATUS   ROLES   AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
aks-agentpool-21722195-vmss000000   Ready    agent   5m10s   v1.24.9   10.224.88.0   <none>        Ubuntu 18.04.6 LTS   5.4.0-1103-azure   containerd://1.6.17+azure-1
aks-agentpool-21722195-vmss000001   Ready    agent   5m11s   v1.24.9   10.224.88.1   <none>        Ubuntu 18.04.6 LTS   5.4.0-1103-azure   containerd://1.6.17+azure-1
aks-agentpool-21722195-vmss000002   Ready    agent   5m10s   v1.24.9   10.224.88.2   <none>        Ubuntu 18.04.6 LTS   5.4.0-1103-azure   containerd://1.6.17+azure-1
```

## cloud [ ~/clouddrive/terraformguru ]$ kubectl get nodes -o wide -A --show-labels
```
NAME                                STATUS   ROLES   AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME             LABELS
aks-agentpool-21722195-vmss000000   Ready    agent   5m33s   v1.24.9   10.224.88.0   <none>        Ubuntu 18.04.6 LTS   5.4.0-1103-azure   containerd://1.6.17+azure-1   agentpool=agentpool,beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=Standard_D2s_v3,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=centralus,failure-domain.beta.kubernetes.io/zone=0,kubernetes.azure.com/agentpool=agentpool,kubernetes.azure.com/cluster=MC_664-29c2715c-create-an-aks-cluster-in-azure-with-t_k8sguru_c,kubernetes.azure.com/kubelet-identity-client-id=,kubernetes.azure.com/mode=system,kubernetes.azure.com/node-image-version=AKSUbuntu-1804gen2containerd-2023.02.15,kubernetes.azure.com/os-sku=Ubuntu,kubernetes.azure.com/role=agent,kubernetes.azure.com/storageprofile=managed,kubernetes.azure.com/storagetier=Premium_LRS,kubernetes.io/arch=amd64,kubernetes.io/hostname=aks-agentpool-21722195-vmss000000,kubernetes.io/os=linux,kubernetes.io/role=agent,node-role.kubernetes.io/agent=,node.kubernetes.io/instance-type=Standard_D2s_v3,storageprofile=managed,storagetier=Premium_LRS,topology.disk.csi.azure.com/zone=,topology.kubernetes.io/region=centralus,topology.kubernetes.io/zone=0
aks-agentpool-21722195-vmss000001   Ready    agent   5m34s   v1.24.9   10.224.88.1   <none>        Ubuntu 18.04.6 LTS   5.4.0-1103-azure   containerd://1.6.17+azure-1   agentpool=agentpool,beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=Standard_D2s_v3,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=centralus,failure-domain.beta.kubernetes.io/zone=0,kubernetes.azure.com/agentpool=agentpool,kubernetes.azure.com/cluster=MC_664-29c2715c-create-an-aks-cluster-in-azure-with-t_k8sguru_c,kubernetes.azure.com/kubelet-identity-client-id=,kubernetes.azure.com/mode=system,kubernetes.azure.com/node-image-version=AKSUbuntu-1804gen2containerd-2023.02.15,kubernetes.azure.com/os-sku=Ubuntu,kubernetes.azure.com/role=agent,kubernetes.azure.com/storageprofile=managed,kubernetes.azure.com/storagetier=Premium_LRS,kubernetes.io/arch=amd64,kubernetes.io/hostname=aks-agentpool-21722195-vmss000001,kubernetes.io/os=linux,kubernetes.io/role=agent,node-role.kubernetes.io/agent=,node.kubernetes.io/instance-type=Standard_D2s_v3,storageprofile=managed,storagetier=Premium_LRS,topology.disk.csi.azure.com/zone=,topology.kubernetes.io/region=centralus,topology.kubernetes.io/zone=0
aks-agentpool-21722195-vmss000002   Ready    agent   5m33s   v1.24.9   10.224.88.2   <none>        Ubuntu 18.04.6 LTS   5.4.0-1103-azure   containerd://1.6.17+azure-1   agentpool=agentpool,beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=Standard_D2s_v3,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=centralus,failure-domain.beta.kubernetes.io/zone=0,kubernetes.azure.com/agentpool=agentpool,kubernetes.azure.com/cluster=MC_664-29c2715c-create-an-aks-cluster-in-azure-with-t_k8sguru_c,kubernetes.azure.com/kubelet-identity-client-id=,kubernetes.azure.com/mode=system,kubernetes.azure.com/node-image-version=AKSUbuntu-1804gen2containerd-2023.02.15,kubernetes.azure.com/os-sku=Ubuntu,kubernetes.azure.com/role=agent,kubernetes.azure.com/storageprofile=managed,kubernetes.azure.com/storagetier=Premium_LRS,kubernetes.io/arch=amd64,kubernetes.io/hostname=aks-agentpool-21722195-vmss000002,kubernetes.io/os=linux,kubernetes.io/role=agent,node-role.kubernetes.io/agent=,node.kubernetes.io/instance-type=Standard_D2s_v3,storageprofile=managed,storagetier=Premium_LRS,topology.disk.csi.azure.com/zone=,topology.kubernetes.io/region=centralus,topology.kubernetes.io/zone=0
```

## cloud [ ~/clouddrive/terraformguru ]$ kubectl get all -o wide -A
```
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE     IP            NODE                                NOMINATED NODE   READINESS GATES
kube-system   pod/azure-ip-masq-agent-kcwwh             1/1     Running   0          5m59s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/azure-ip-masq-agent-lsmvb             1/1     Running   0          5m59s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>
kube-system   pod/azure-ip-masq-agent-wvfk9             1/1     Running   0          6m      10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>
kube-system   pod/cloud-node-manager-c9rpb              1/1     Running   0          5m59s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/cloud-node-manager-ckxzh              1/1     Running   0          6m      10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>
kube-system   pod/cloud-node-manager-wqd24              1/1     Running   0          5m59s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>
kube-system   pod/coredns-59b6bf8b4f-46t8p              1/1     Running   0          5m2s    10.244.0.2    aks-agentpool-21722195-vmss000001   <none>           <none>
kube-system   pod/coredns-59b6bf8b4f-jnsbv              1/1     Running   0          6m10s   10.244.1.5    aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/coredns-autoscaler-5655d66f64-mgtzn   1/1     Running   0          6m10s   10.244.1.2    aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/csi-azuredisk-node-96gdm              3/3     Running   0          5m59s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>
kube-system   pod/csi-azuredisk-node-br9jc              3/3     Running   0          6m      10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>
kube-system   pod/csi-azuredisk-node-g7xmm              3/3     Running   0          5m59s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/csi-azurefile-node-kn58c              3/3     Running   0          5m59s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>
kube-system   pod/csi-azurefile-node-vmn89              3/3     Running   0          5m59s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/csi-azurefile-node-xnshf              3/3     Running   0          6m      10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>
kube-system   pod/konnectivity-agent-7c54dcb545-9fbf5   1/1     Running   0          6m10s   10.244.1.4    aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/konnectivity-agent-7c54dcb545-fm5rm   1/1     Running   0          6m10s   10.244.1.3    aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/kube-proxy-948ll                      1/1     Running   0          6m      10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>
kube-system   pod/kube-proxy-964hl                      1/1     Running   0          5m59s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>
kube-system   pod/kube-proxy-x4hfb                      1/1     Running   0          5m59s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>
kube-system   pod/metrics-server-5f8d84558d-dz856       2/2     Running   0          4m56s   10.244.0.3    aks-agentpool-21722195-vmss000001   <none>           <none>
kube-system   pod/metrics-server-5f8d84558d-z4r7m       2/2     Running   0          4m56s   10.244.2.2    aks-agentpool-21722195-vmss000000   <none>           <none>

NAMESPACE     NAME                     TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)         AGE     SELECTOR
default       service/kubernetes       ClusterIP   10.0.0.1       <none>        443/TCP         6m50s   <none>
kube-system   service/kube-dns         ClusterIP   10.0.0.10      <none>        53/UDP,53/TCP   6m11s   k8s-app=kube-dns
kube-system   service/metrics-server   ClusterIP   10.0.188.189   <none>        443/TCP         6m11s   k8s-app=metrics-server

NAMESPACE     NAME                                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE     CONTAINERS                                       IMAGES                                                                                                                                                                                       SELECTOR
kube-system   daemonset.apps/azure-ip-masq-agent          3         3         3       3            3           <none>          6m11s   azure-ip-masq-agent                              mcr.microsoft.com/aks/ip-masq-agent-v2:v0.1.5                                                                                                                                                k8s-app=azure-ip-masq-agent,tier=node
kube-system   daemonset.apps/cloud-node-manager           3         3         3       3            3           <none>          6m11s   cloud-node-manager                               mcr.microsoft.com/oss/kubernetes/azure-cloud-node-manager:v1.24.11                                                                                                                           k8s-app=cloud-node-manager
kube-system   daemonset.apps/cloud-node-manager-windows   0         0         0       0            0           <none>          6m11s   cloud-node-manager                               mcr.microsoft.com/oss/kubernetes/azure-cloud-node-manager:v1.24.11                                                                                                                           k8s-app=cloud-node-manager-windows
kube-system   daemonset.apps/csi-azuredisk-node           3         3         3       3            3           <none>          6m11s   liveness-probe,node-driver-registrar,azuredisk   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azuredisk-csi:v1.26.2   app=csi-azuredisk-node
kube-system   daemonset.apps/csi-azuredisk-node-win       0         0         0       0            0           <none>          6m11s   liveness-probe,node-driver-registrar,azuredisk   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azuredisk-csi:v1.26.2   app=csi-azuredisk-node-win
kube-system   daemonset.apps/csi-azurefile-node           3         3         3       3            3           <none>          6m11s   liveness-probe,node-driver-registrar,azurefile   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azurefile-csi:v1.24.0   app=csi-azurefile-node
kube-system   daemonset.apps/csi-azurefile-node-win       0         0         0       0            0           <none>          6m11s   liveness-probe,node-driver-registrar,azurefile   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azurefile-csi:v1.24.0   app=csi-azurefile-node-win
kube-system   daemonset.apps/kube-proxy                   3         3         3       3            3           <none>          6m11s   kube-proxy                                       mcr.microsoft.com/oss/kubernetes/kube-proxy:v1.24.9.2                                                                                                                                        component=kube-proxy,tier=node

NAMESPACE     NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS                          IMAGES                                                                                                                    SELECTOR
kube-system   deployment.apps/coredns              2/2     2            2           6m11s   coredns                             mcr.microsoft.com/oss/kubernetes/coredns:v1.9.3                                                                           k8s-app=kube-dns,version=v20
kube-system   deployment.apps/coredns-autoscaler   1/1     1            1           6m11s   autoscaler                          mcr.microsoft.com/oss/kubernetes/autoscaler/cluster-proportional-autoscaler:1.8.5                                         k8s-app=coredns-autoscaler
kube-system   deployment.apps/konnectivity-agent   2/2     2            2           6m11s   konnectivity-agent                  mcr.microsoft.com/oss/kubernetes/apiserver-network-proxy/agent:v0.0.33-hotfix.20221110                                    app=konnectivity-agent
kube-system   deployment.apps/metrics-server       2/2     2            2           6m11s   metrics-server-vpa,metrics-server   mcr.microsoft.com/oss/kubernetes/autoscaler/addon-resizer:1.8.14,mcr.microsoft.com/oss/kubernetes/metrics-server:v0.6.1   k8s-app=metrics-server

NAMESPACE     NAME                                            DESIRED   CURRENT   READY   AGE     CONTAINERS                          IMAGES                                                                                                                    SELECTOR
kube-system   replicaset.apps/coredns-59b6bf8b4f              2         2         2       6m11s   coredns                             mcr.microsoft.com/oss/kubernetes/coredns:v1.9.3                                                                           k8s-app=kube-dns,pod-template-hash=59b6bf8b4f,version=v20
kube-system   replicaset.apps/coredns-autoscaler-5655d66f64   1         1         1       6m11s   autoscaler                          mcr.microsoft.com/oss/kubernetes/autoscaler/cluster-proportional-autoscaler:1.8.5                                         k8s-app=coredns-autoscaler,pod-template-hash=5655d66f64
kube-system   replicaset.apps/konnectivity-agent-7c54dcb545   2         2         2       6m11s   konnectivity-agent                  mcr.microsoft.com/oss/kubernetes/apiserver-network-proxy/agent:v0.0.33-hotfix.20221110                                    app=konnectivity-agent,pod-template-hash=7c54dcb545
kube-system   replicaset.apps/metrics-server-58df99c858       0         0         0       6m11s   metrics-server-vpa,metrics-server   mcr.microsoft.com/oss/kubernetes/autoscaler/addon-resizer:1.8.14,mcr.microsoft.com/oss/kubernetes/metrics-server:v0.6.1   k8s-app=metrics-server,pod-template-hash=58df99c858
kube-system   replicaset.apps/metrics-server-5f8d84558d       2         2         2       4m57s   metrics-server-vpa,metrics-server   mcr.microsoft.com/oss/kubernetes/autoscaler/addon-resizer:1.8.14,mcr.microsoft.com/oss/kubernetes/metrics-server:v0.6.1   k8s-app=metrics-server,pod-template-hash=5f8d84558d
```

## cloud [ ~/clouddrive/terraformguru ]$ kubectl get all -o wide -A --show-labels
```
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE     IP            NODE                                NOMINATED NODE   READINESS GATES   LABELS
kube-system   pod/azure-ip-masq-agent-kcwwh             1/1     Running   0          6m27s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>            controller-revision-hash=85b7dfff54,k8s-app=azure-ip-masq-agent,pod-template-generation=1,tier=node
kube-system   pod/azure-ip-masq-agent-lsmvb             1/1     Running   0          6m27s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>            controller-revision-hash=85b7dfff54,k8s-app=azure-ip-masq-agent,pod-template-generation=1,tier=node
kube-system   pod/azure-ip-masq-agent-wvfk9             1/1     Running   0          6m28s   10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>            controller-revision-hash=85b7dfff54,k8s-app=azure-ip-masq-agent,pod-template-generation=1,tier=node
kube-system   pod/cloud-node-manager-c9rpb              1/1     Running   0          6m27s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>            controller-revision-hash=859967d78d,k8s-app=cloud-node-manager,pod-template-generation=1
kube-system   pod/cloud-node-manager-ckxzh              1/1     Running   0          6m28s   10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>            controller-revision-hash=859967d78d,k8s-app=cloud-node-manager,pod-template-generation=1
kube-system   pod/cloud-node-manager-wqd24              1/1     Running   0          6m27s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>            controller-revision-hash=859967d78d,k8s-app=cloud-node-manager,pod-template-generation=1
kube-system   pod/coredns-59b6bf8b4f-46t8p              1/1     Running   0          5m30s   10.244.0.2    aks-agentpool-21722195-vmss000001   <none>           <none>            k8s-app=kube-dns,kubernetes.io/cluster-service=true,pod-template-hash=59b6bf8b4f,version=v20
kube-system   pod/coredns-59b6bf8b4f-jnsbv              1/1     Running   0          6m38s   10.244.1.5    aks-agentpool-21722195-vmss000002   <none>           <none>            k8s-app=kube-dns,kubernetes.io/cluster-service=true,pod-template-hash=59b6bf8b4f,version=v20
kube-system   pod/coredns-autoscaler-5655d66f64-mgtzn   1/1     Running   0          6m38s   10.244.1.2    aks-agentpool-21722195-vmss000002   <none>           <none>            k8s-app=coredns-autoscaler,pod-template-hash=5655d66f64
kube-system   pod/csi-azuredisk-node-96gdm              3/3     Running   0          6m27s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>            app=csi-azuredisk-node,controller-revision-hash=77fc5b9c64,pod-template-generation=1
kube-system   pod/csi-azuredisk-node-br9jc              3/3     Running   0          6m28s   10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>            app=csi-azuredisk-node,controller-revision-hash=77fc5b9c64,pod-template-generation=1
kube-system   pod/csi-azuredisk-node-g7xmm              3/3     Running   0          6m27s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>            app=csi-azuredisk-node,controller-revision-hash=77fc5b9c64,pod-template-generation=1
kube-system   pod/csi-azurefile-node-kn58c              3/3     Running   0          6m27s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>            app=csi-azurefile-node,controller-revision-hash=6b6b77f785,pod-template-generation=1
kube-system   pod/csi-azurefile-node-vmn89              3/3     Running   0          6m27s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>            app=csi-azurefile-node,controller-revision-hash=6b6b77f785,pod-template-generation=1
kube-system   pod/csi-azurefile-node-xnshf              3/3     Running   0          6m28s   10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>            app=csi-azurefile-node,controller-revision-hash=6b6b77f785,pod-template-generation=1
kube-system   pod/konnectivity-agent-7c54dcb545-9fbf5   1/1     Running   0          6m38s   10.244.1.4    aks-agentpool-21722195-vmss000002   <none>           <none>            app=konnectivity-agent,component=tunnel,pod-template-hash=7c54dcb545
kube-system   pod/konnectivity-agent-7c54dcb545-fm5rm   1/1     Running   0          6m38s   10.244.1.3    aks-agentpool-21722195-vmss000002   <none>           <none>            app=konnectivity-agent,component=tunnel,pod-template-hash=7c54dcb545
kube-system   pod/kube-proxy-948ll                      1/1     Running   0          6m28s   10.224.88.1   aks-agentpool-21722195-vmss000001   <none>           <none>            component=kube-proxy,controller-revision-hash=79999c7dff,pod-template-generation=1,tier=node
kube-system   pod/kube-proxy-964hl                      1/1     Running   0          6m27s   10.224.88.2   aks-agentpool-21722195-vmss000002   <none>           <none>            component=kube-proxy,controller-revision-hash=79999c7dff,pod-template-generation=1,tier=node
kube-system   pod/kube-proxy-x4hfb                      1/1     Running   0          6m27s   10.224.88.0   aks-agentpool-21722195-vmss000000   <none>           <none>            component=kube-proxy,controller-revision-hash=79999c7dff,pod-template-generation=1,tier=node
kube-system   pod/metrics-server-5f8d84558d-dz856       2/2     Running   0          5m24s   10.244.0.3    aks-agentpool-21722195-vmss000001   <none>           <none>            k8s-app=metrics-server,pod-template-hash=5f8d84558d
kube-system   pod/metrics-server-5f8d84558d-z4r7m       2/2     Running   0          5m24s   10.244.2.2    aks-agentpool-21722195-vmss000000   <none>           <none>            k8s-app=metrics-server,pod-template-hash=5f8d84558d

NAMESPACE     NAME                     TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)         AGE     SELECTOR                 LABELS
default       service/kubernetes       ClusterIP   10.0.0.1       <none>        443/TCP         7m18s   <none>                   component=apiserver,provider=kubernetes
kube-system   service/kube-dns         ClusterIP   10.0.0.10      <none>        53/UDP,53/TCP   6m39s   k8s-app=kube-dns         addonmanager.kubernetes.io/mode=Reconcile,k8s-app=kube-dns,kubernetes.io/cluster-service=true,kubernetes.io/name=CoreDNS
kube-system   service/metrics-server   ClusterIP   10.0.188.189   <none>        443/TCP         6m39s   k8s-app=metrics-server   addonmanager.kubernetes.io/mode=Reconcile,kubernetes.io/cluster-service=true,kubernetes.io/name=Metrics-server

NAMESPACE     NAME                                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE     CONTAINERS                                       IMAGES                                                                                                                                                                                       SELECTOR                                LABELS
kube-system   daemonset.apps/azure-ip-masq-agent          3         3         3       3            3           <none>          6m39s   azure-ip-masq-agent                              mcr.microsoft.com/aks/ip-masq-agent-v2:v0.1.5                                                                                                                                                k8s-app=azure-ip-masq-agent,tier=node   addonmanager.kubernetes.io/mode=Reconcile,component=azure-ip-masq-agent,kubernetes.io/cluster-service=true,tier=node
kube-system   daemonset.apps/cloud-node-manager           3         3         3       3            3           <none>          6m39s   cloud-node-manager                               mcr.microsoft.com/oss/kubernetes/azure-cloud-node-manager:v1.24.11                                                                                                                           k8s-app=cloud-node-manager              addonmanager.kubernetes.io/mode=Reconcile,k8s-app=cloud-node-manager,kubernetes.io/cluster-service=true
kube-system   daemonset.apps/cloud-node-manager-windows   0         0         0       0            0           <none>          6m39s   cloud-node-manager                               mcr.microsoft.com/oss/kubernetes/azure-cloud-node-manager:v1.24.11                                                                                                                           k8s-app=cloud-node-manager-windows      addonmanager.kubernetes.io/mode=Reconcile,k8s-app=cloud-node-manager,kubernetes.io/cluster-service=true
kube-system   daemonset.apps/csi-azuredisk-node           3         3         3       3            3           <none>          6m39s   liveness-probe,node-driver-registrar,azuredisk   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azuredisk-csi:v1.26.2   app=csi-azuredisk-node                  addonmanager.kubernetes.io/mode=Reconcile,kubernetes.io/cluster-service=true
kube-system   daemonset.apps/csi-azuredisk-node-win       0         0         0       0            0           <none>          6m39s   liveness-probe,node-driver-registrar,azuredisk   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azuredisk-csi:v1.26.2   app=csi-azuredisk-node-win              addonmanager.kubernetes.io/mode=Reconcile,kubernetes.io/cluster-service=true
kube-system   daemonset.apps/csi-azurefile-node           3         3         3       3            3           <none>          6m39s   liveness-probe,node-driver-registrar,azurefile   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azurefile-csi:v1.24.0   app=csi-azurefile-node                  addonmanager.kubernetes.io/mode=Reconcile,kubernetes.io/cluster-service=true
kube-system   daemonset.apps/csi-azurefile-node-win       0         0         0       0            0           <none>          6m39s   liveness-probe,node-driver-registrar,azurefile   mcr.microsoft.com/oss/kubernetes-csi/livenessprobe:v2.6.0,mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar:v2.5.0,mcr.microsoft.com/oss/kubernetes-csi/azurefile-csi:v1.24.0   app=csi-azurefile-node-win              addonmanager.kubernetes.io/mode=Reconcile,kubernetes.io/cluster-service=true
kube-system   daemonset.apps/kube-proxy                   3         3         3       3            3           <none>          6m39s   kube-proxy                                       mcr.microsoft.com/oss/kubernetes/kube-proxy:v1.24.9.2                                                                                                                                        component=kube-proxy,tier=node          addonmanager.kubernetes.io/mode=Reconcile,component=kube-proxy,tier=node

NAMESPACE     NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS                          IMAGES                                                                                                                    SELECTOR                       LABELS
kube-system   deployment.apps/coredns              2/2     2            2           6m39s   coredns                             mcr.microsoft.com/oss/kubernetes/coredns:v1.9.3                                                                           k8s-app=kube-dns,version=v20   addonmanager.kubernetes.io/mode=Reconcile,k8s-app=kube-dns,kubernetes.io/cluster-service=true,kubernetes.io/name=CoreDNS,version=v20
kube-system   deployment.apps/coredns-autoscaler   1/1     1            1           6m39s   autoscaler                          mcr.microsoft.com/oss/kubernetes/autoscaler/cluster-proportional-autoscaler:1.8.5                                         k8s-app=coredns-autoscaler     addonmanager.kubernetes.io/mode=Reconcile,k8s-app=coredns-autoscaler,kubernetes.io/cluster-service=true
kube-system   deployment.apps/konnectivity-agent   2/2     2            2           6m39s   konnectivity-agent                  mcr.microsoft.com/oss/kubernetes/apiserver-network-proxy/agent:v0.0.33-hotfix.20221110                                    app=konnectivity-agent         addonmanager.kubernetes.io/mode=Reconcile,app=konnectivity-agent,kubernetes.io/cluster-service=true
kube-system   deployment.apps/metrics-server       2/2     2            2           6m39s   metrics-server-vpa,metrics-server   mcr.microsoft.com/oss/kubernetes/autoscaler/addon-resizer:1.8.14,mcr.microsoft.com/oss/kubernetes/metrics-server:v0.6.1   k8s-app=metrics-server         addonmanager.kubernetes.io/mode=Reconcile,k8s-app=metrics-server,kubernetes.io/cluster-service=true

NAMESPACE     NAME                                            DESIRED   CURRENT   READY   AGE     CONTAINERS                          IMAGES                                                                                                                    SELECTOR                                                    LABELS
kube-system   replicaset.apps/coredns-59b6bf8b4f              2         2         2       6m39s   coredns                             mcr.microsoft.com/oss/kubernetes/coredns:v1.9.3                                                                           k8s-app=kube-dns,pod-template-hash=59b6bf8b4f,version=v20   k8s-app=kube-dns,kubernetes.io/cluster-service=true,pod-template-hash=59b6bf8b4f,version=v20
kube-system   replicaset.apps/coredns-autoscaler-5655d66f64   1         1         1       6m39s   autoscaler                          mcr.microsoft.com/oss/kubernetes/autoscaler/cluster-proportional-autoscaler:1.8.5                                         k8s-app=coredns-autoscaler,pod-template-hash=5655d66f64     k8s-app=coredns-autoscaler,pod-template-hash=5655d66f64
kube-system   replicaset.apps/konnectivity-agent-7c54dcb545   2         2         2       6m39s   konnectivity-agent                  mcr.microsoft.com/oss/kubernetes/apiserver-network-proxy/agent:v0.0.33-hotfix.20221110                                    app=konnectivity-agent,pod-template-hash=7c54dcb545         app=konnectivity-agent,component=tunnel,pod-template-hash=7c54dcb545
kube-system   replicaset.apps/metrics-server-58df99c858       0         0         0       6m39s   metrics-server-vpa,metrics-server   mcr.microsoft.com/oss/kubernetes/autoscaler/addon-resizer:1.8.14,mcr.microsoft.com/oss/kubernetes/metrics-server:v0.6.1   k8s-app=metrics-server,pod-template-hash=58df99c858         k8s-app=metrics-server,pod-template-hash=58df99c858
kube-system   replicaset.apps/metrics-server-5f8d84558d       2         2         2       5m25s   metrics-server-vpa,metrics-server   mcr.microsoft.com/oss/kubernetes/autoscaler/addon-resizer:1.8.14,mcr.microsoft.com/oss/kubernetes/metrics-server:v0.6.1   k8s-app=metrics-server,pod-template-hash=5f8d84558d         k8s-app=metrics-server,pod-template-hash=5f8d84558d
```

# After Successfully Deploying the AKS Cluster on Azure:
![overview.PNG](./images/overview.PNG)
![activity-log.PNG](./images/activity-log.PNG)
![conf.PNG](./images/conf.PNG)
![namespaces.PNG](./images/namespaces.PNG)
![networking.PNG](./images/networking.PNG)
![nodepools.PNG](./images/nodepools.PNG)
![properties.PNG](./images/properties.PNG)
![services-n-ingresses.PNG](./images/services-n-ingresses.PNG)
![workloads.PNG](./images/workloads.PNG)
