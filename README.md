# Azure Infrastructure Automation using Terraform & Azure DevOps (DevSecOps)

This repository contains **Infrastructure as Code (IaC)** implemented using **Terraform** to provision and manage Microsoft Azure resources.
The infrastructure deployment is automated through an **Azure DevOps DevSecOps pipeline**, ensuring security, compliance, cost visibility, and reliable deployments.

---

## 🚀 Project Overview

The objective of this project is to build a **secure, automated, and scalable Azure infrastructure** using Terraform and Azure DevOps.

Key goals include:

* Automating Azure infrastructure provisioning
* Implementing **DevSecOps practices** in CI/CD
* Performing security and compliance scans before deployment
* Analyzing infrastructure cost prior to applying changes
* Maintaining consistent and version-controlled infrastructure

---

## 🧱 Azure Resources Provisioned

The Terraform modules provision the following Azure resources:

* Resource Group
* Virtual Network
* Subnets
* Network Security Groups (NSG)
* Public IP Address
* Network Interface
* Virtual Machine

---

## 🧰 Tools & Technologies

| Tool            | Purpose                             |
| --------------- | ----------------------------------- |
| Terraform       | Infrastructure as Code              |
| Microsoft Azure | Cloud platform                      |
| Azure DevOps    | CI/CD & DevSecOps                   |
| TFLint          | Terraform best practices validation |
| Checkov         | Security & compliance scanning      |
| Terrascan       | IaC security scanning               |
| Infracost       | Cloud cost estimation               |
| Azure CLI       | Azure authentication                |

---

## 📁 Repository Structure

```
Azure-infrastructure/
├── azurerm_resource/
├── azurerm_virtualnetwork/
├── azurerm_subnet/
├── azurerm_nsg/
├── azurerm_publicip/
├── azurerm_nic/
├── azurerm_virtualmachine/
├── environment/
│   └── dev/
├── pipeline_devSecOps.yml
└── README.md
```

---

## ⚙️ Prerequisites

Before running this project, ensure you have:

* An active **Azure Subscription**
* **Terraform** (v1.x or later)
* An **Azure DevOps Project**
* Azure Resource Manager **Service Connection**
* Contributor permissions on Azure resources

---

## 🔐 Azure DevOps Service Connection

The pipeline authenticates to Azure using an **Azure Resource Manager Service Connection**.

Steps:

1. Create a Service Principal in Azure
2. Assign **Contributor** role
3. Configure the Service Connection in Azure DevOps

This ensures secure, secret-less authentication within the pipeline.

---

## 🚦 Azure DevOps DevSecOps Pipeline

The pipeline configuration is defined in:

**`pipeline_devSecOps.yml`**

**Pipeline Name:** `infra_devSecOps_pipeline`
**Trigger:** Manual (`trigger: none`)
**Environment:** `dev`

---

## 🧩 Pipeline Variables

* **Variable Group:** `New variable group`
* **Pipeline Variable:**

  * `codepath = $(System.DefaultWorkingDirectory)/environment/dev`

These variables enable environment-specific and secure configuration management.

---

## 🏗️ Pipeline Stages

### 1️⃣ Terraform Tool Setup (`terraform_tool`)

* Installs the latest Terraform version
* Initializes Terraform backend
* Configures remote state using Azure Storage Account

**Backend Configuration:**

* Storage Account: `devstoragedevaccount`
* Container: `terraformcotainer`
* State File: `deve.tfstate`

---

### 2️⃣ Static Analysis (`static_analysis`)

This stage enforces **shift-left security** by scanning Terraform code before deployment.

#### 🔹 TFLint

* Validates Terraform best practices
* Generates JSON lint report
* Publishes artifact for auditing

#### 🔹 Checkov

* Scans Terraform code for security and compliance issues
* Detects misconfigurations and policy violations

#### 🔹 Terrascan

* Performs security scanning on IaC
* Identifies vulnerabilities and policy violations

---

### 3️⃣ Cost Analysis (`infracost_analysis`)

* Executes `terraform plan`
* Performs cost estimation using **Infracost**
* Uses `INFRACOST_API_KEY` stored securely in pipeline secrets

This helps prevent unexpected cloud costs before deployment.

---

### 4️⃣ Terraform Apply (`terraform_apply`)

* Re-initializes Terraform
* Applies the approved Terraform plan
* Provisions infrastructure in Azure Dev environment

This stage executes only after all security and cost checks succeed.

---

## ▶️ Manual Execution (Optional)

You can also run Terraform manually:

```bash
terraform init
terraform plan
terraform apply
```

---

## 🔒 Security & DevSecOps Best Practices

* Remote Terraform state stored securely in Azure Storage
* Secure authentication using Azure Service Connection
* Integrated security scanning:

  * TFLint
  * Checkov
  * Terrascan
* Cost governance using Infracost
* Artifact publishing for audit and compliance

---

## 🎯 Key Benefits

* End-to-end DevSecOps pipeline for Azure infrastructure
* Automated, secure, and consistent deployments
* Early detection of security risks
* Cost visibility before provisioning
* Modular and scalable Terraform design

---


