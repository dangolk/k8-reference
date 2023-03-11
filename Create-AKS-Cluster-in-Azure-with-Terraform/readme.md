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

