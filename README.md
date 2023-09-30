# Kubernetes Dashboard Deployment with Terraform

This repository provides a Terraform script (`dashboard.tf`) that allows you to deploy a Kubernetes dashboard. Starting from Kubernetes 1.24, there has been a change in the association between a service account and secrets. This Terraform script generates a non-expiring secret and associates it with the service account that will be used to access the dashboard.

## Table of Contents

- [Introduction](#introduction)
- [File Description](#file-description)
- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Kubernetes dashboards provide a web-based graphical user interface for managing and monitoring Kubernetes clusters. This Terraform script simplifies the deployment of the Kubernetes dashboard and addresses changes introduced in Kubernetes 1.24 regarding service account secrets.

## File Description

- `dashboard.tf`: This Terraform script defines the resources required to deploy the Kubernetes dashboard, including service accounts, secrets, roles, and role bindings.

## Usage

To deploy the Kubernetes dashboard using the provided Terraform script (`dashboard.tf`), follow these steps:

1. Clone this repository to your local machine:
   ```shell
   git clone https://github.com/radeeka/terraform-kubernetes-dashboard.git
   ```

2. Change into the cloned directory:
   ```shell
   cd terraform-kubernetes-dashboard
   ```

3. Ensure that you have the necessary prerequisites (see below).

4. Customize the `dashboard.tf` script if needed, adjusting any variables or settings to match your Kubernetes environment.

5. Run Terraform commands to plan and apply the deployment:
   ```shell
   terraform init
   terraform plan
   terraform apply
   ```

6. Monitor the deployment progress and verify that the Kubernetes dashboard is accessible.

### Prerequisites

Before using this Terraform script to deploy the Kubernetes dashboard, make sure you have the following prerequisites in place:

- A Kubernetes cluster up and running.
- Terraform installed locally.
- Appropriate permissions and credentials to manage resources in your Kubernetes cluster.

## Customization

You can customize the `dashboard.tf` script to fit your specific requirements. Be sure to review the script to understand how it's defining service accounts, secrets, roles, and role bindings for the dashboard deployment.

## Contributing

Contributions to enhance and improve this Terraform script are welcome. If you encounter issues, have suggestions, or want to contribute improvements, please open an issue or submit a pull request following our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE), allowing you to use, modify, and distribute the Terraform script according to the terms of the license.
