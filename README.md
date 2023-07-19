# ADO_Agents
Example of deploying Azure Devops Agents with TF Azure Lab

ADO = Azure Devops

This will create a linux and windows build agent within a single resource group and join them to your ADO Agent Pool this is helpful if you want to do custom builds within ADO. 

Steps
* Clone this repository 
* Ensure you have terraform installed

Follow the steps detailed in the MS Learn links below 

* [Create an Org in ADO](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization?view=azure-devops)
* [Create an agent pool](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/pools-queues?view=azure-devops&tabs=yaml%2Cbrowser)
* [Create a PAT Token](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows)

Gather the information org name and url, PAT Token, agent pool name and update the ps and update the .sh and .ps1 file in the repo where marked 

execute the terraform commands below within the folder of the files. 

Initialise

    terraform init -upgrade

Plan

    terraform plan -out main.tfplan

Apply

    terraform apply main.tfplan


You can now RDP to the server with the password in the output and the ip address or just check your agent pool for the agents listed and then clean up the environment

DESTROY!!!!!!!!!!!!!

    terraform plan -destroy -out main.destroy.tfplan
    terraform apply "main.destroy.tfplan"


You may want to add additional installs / scripts to these vms / consider scalesets / domain join etc....

Good luck

References below have helped in making this example 
* [IE](https://gist.github.com/MaxMelcher/fa10b8bd7f1e39910c0402576ccf1b1f)
* [Linux Machine Creation](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform)
* [Windows VM Creation](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-terraform)
* [Keyvault Creation](https://learn.microsoft.com/en-us/azure/key-vault/keys/quick-create-terraform?tabs=azure-cli)
* [Random Pet name generator](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet.html?source=post_page---------------------------#example-usage)
* [Issue with Null for keyvault current user access policy](https://stackoverflow.com/questions/64989203/terraform-create-a-azure-key-vault#:~:text=Upgrade%20to%20version%20%3D%20%22%3D3.42.0%22%20solveded%20for%20me%20the%20same%20issue)
* [ADO Agent Extension](https://jamescook.dev/azuredevops-linux-agent-install-using-terraform)
