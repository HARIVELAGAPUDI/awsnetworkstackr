
> **Terraform Infrastructure Deployment**


This repository contains Terraform scripts to deploy AWS infrastructure for a specified environment. You can use these scripts to provision VPCs, subnets, security groups, route tables, NAT gateways, internet gateways, VPC endpoints, and other resources on AWS.



> **GitLab CI/CD Configuration**




This repository also contains GitLab CI/CD configuration for automating the deployment and management of infrastructure using Terraform.



> **Overview**




The GitLab CI/CD pipeline defined in the .gitlab-ci.yml file orchestrates the following stages:

`Pre-deploy Stage`: This stage performs pre-deployment tasks such as formatting Terraform files and validating their syntax.
also it contains specified backend configuration parameters, which include the backend address, lock address, username, password, lock method, unlock method, and retry wait duration. These parameters ensure that Terraform interacts with the correct backend and uses the appropriate authentication credentials for state management. Adjust the values of the backend configuration parameters according to your environment and requirements

`Plan Stage`: This stage generates an execution plan for the Terraform deployment by running terraform plan command. The plan is saved to an output file for review.

`Deploy Stage`: This stage applies the Terraform configuration to create or update the infrastructure. It is executed manually to prevent accidental changes.

`Destroy Stage`: This stage allows manual destruction of the infrastructure provisioned by Terraform. It is triggered only for merge requests targeting branches other than the default branch.


In pipeline following variables are defined to manage the Terraform state:

STATEFILE_NAME: Specifies the name of the Terraform state file, including the project ID.

TF_ADDRESS: Specifies the URL address of the Terraform backend, including the project ID and state file name.

TF_USERNAME: Specifies the GitLab username used for authentication.

TF_PASSWORD: Specifies the GitLab personal access token (PAT) used for authentication.


> **Prerequisites**




Before you begin, make sure you have the following:

AWS account with appropriate permissions to create resources(AWS_ACCESS_KEY,AWS_SECRET_KEY).
GitLab username(GITLAB_USERNAME) and personal access token (GITLAB_TOKEN) for authenticating with GitLab.



> **Usage**


To deploy the infrastructure:

Clone Repository: Clone this repository to your local machine or fork it to your GitLab account.

`Update Variables`: Update the env/UAT.tfvars file with your desired configuration. Modify the variables such as region, VPC settings, subnet details, security group rules, etc., as needed for your environment.

`Submit Merge Request` (MR): Once you've made the necessary changes, commit them to a new branch and push the branch to GitLab. Create a merge request targeting the main branch. This will trigger the GitLab CI/CD pipeline to deploy the infrastructure.

`Review Pipeline Output`: Monitor the pipeline execution in GitLab CI/CD. Check the logs for any errors or warnings during the deployment process.

`Confirm Deployment`: After the pipeline completes successfully, verify that the infrastructure has been provisioned as expected in the AWS Management Console.



> **Repository Structure**




•`env/UAT`.tfvars: Contains the variables specific to the UAT environment. Update this file with your desired configuration.

•`modules`/: Directory containing reusable Terraform modules for different types of AWS resources (e.g., VPC, subnets, security groups).

•`scripts/script1.sh:` Shell script for initializing Terraform backend configuration. Modify this script if needed for your environment.

•`backend.tf`: Terraform configuration file specifying the HTTP backend for state management.

•`main.tf`: Main Terraform configuration file defining the infrastructure resources to be provisioned.

•`variables.tf`: Terraform variable definitions for input variables used in the configuration.

•`outputs.tf`: Terraform output definitions for output variables representing the IDs and other details of provisioned resources.




> **Notes**




•	Make sure to review and understand the configuration files before deploying any infrastructure.

•	Update the variables, such as region, VPC CIDR blocks, subnet CIDR blocks, security group rules, etc., according to your specific requirements.

•	Always follow best practices and security guidelines when provisioning infrastructure on AWS.

•	Monitor the costs associated with the provisioned resources to avoid unexpected charges.

