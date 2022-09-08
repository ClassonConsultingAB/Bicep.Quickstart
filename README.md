# Bicep Quickstart

* Bicep templates are located in `.\infrastructure`.
* Run `.\deploy.ps1` to execute deployment.

## Links of interest

* https://docs.microsoft.com/en-us/learn/paths/fundamentals-bicep/
* https://docs.microsoft.com/en-us/azure/templates/
* https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
* https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep

## Why PowerShell instead of XYZ

My recommendation is that the automation you build should be able to run locally, which is a requirement for a short development feedback loop. Also, I think it is beneficial to use a tool where it is possible to use if- and foreach statements.

Writing yaml scripts such as GitHub Workflows or Azure DevOps pipelines does not support any of this. Having to commit changes and wait for a build agent is not acceptable.

PowerShell is a tool that most people are familiar with. But if you are about to do something more complex I would recommend you to consider using [Nuke](https://nuke.build/).

## Why use Az CLI from PowerShell?

In my opinion, Az CLI is easier to use than the Az PowerShell modules.

* Discoverability is great since all commands are organized in a tree under `az`.
* You can get help by entering a command followed by `-h`.
* Logging in to Az CLI is faster on GitHub Workflows and Azure DevOps Pipelines.

## Configuration

In this example, I have set up configuration inline in the `.\deploy.ps1` script to keep things simple.

In a real world scenario, I think it is beneficial to keep the configuration outside of the repo. That is because you will then be able to change stuff without needing to create a new version of your code, for example for mundane things like changing a feature toggle.

I do recommend using Bicep (ARM) to fetch secrets directly from Key Vault.
