# Terraform AWS 3-Tier Project

## Overview

This Terraform project is designed to provision a 3-tier architecture on AWS, consisting of three layers: presentation, application, and data tiers. Each tier is isolated into its own subnet within a Virtual Private Cloud (VPC) for security and scalability.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- [Terraform](https://www.terraform.io/) (version >= 0.12.0)
- AWS CLI configured with appropriate credentials
- Access to an AWS account

## Usage

1. Clone this repository to your local machine.

```bash
git clone <repository-url>
```

2. Navigate to the project directory.

```bash
cd aws-3-tier-project
```

3. Initialize Terraform.

```bash
terraform init
```

4. Review and modify `variables.tf` file to customize the project settings according to your requirements.

5. Review and modify `terraform.tfvars` file to set the values for your AWS access key, secret key, region, etc.

6. Plan the infrastructure changes.

```bash
terraform plan
```

7. Apply the changes to provision the infrastructure.

```bash
terraform apply
```

8. After provisioning is complete, Terraform will output the necessary information such as the URLs or IPs of the provisioned resources.

9. To destroy the infrastructure when it's no longer needed, run:

```bash
terraform destroy
```

## Architecture

The project provisions the following resources in AWS:

- **VPC**: A Virtual Private Cloud to isolate the entire infrastructure.
- **Subnets**: Three subnets - one for each tier (presentation, application, data).
- **Security Groups**: To control inbound and outbound traffic for each tier.
- **EC2 Instances**: Instances for presentation and application tiers.
- **RDS Instance**: A managed relational database service instance for the data tier.
- **Load Balancer**: A load balancer for distributing incoming traffic across multiple instances in the application tier.

## Customization

You can customize the project by modifying the following:

- **variables.tf**: Adjust variables such as instance type, subnet CIDR blocks, etc.
- **terraform.tfvars**: Set your AWS access key, secret key, region, etc.
- **main.tf**: Modify resource configurations or add/remove resources as needed.

## Contributors

- [DavNguch](mailto:davngure254@gmail.com)


## Acknowledgments

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS Documentation](https://docs.aws.amazon.com/index.html)

## Support

For support, contact [support@example.com](mailto:support@example.com).

---

Feel free to enhance this readme file with additional details specific to your project or organization.