# Usage Instructions

### Initialize Terraform
1. Navigate to the `infra/` directory.
2. Run `terraform init` to download the provider and module dependencies.

### Set Variables
Provide values for `project_id` (required) and optionally override `region`, `cluster_name`, or `node_count` by creating a `terraform.tfvars` file, e.g.:

```hcl
project_id = "my-gcp-project"
```

### Apply Configuration
1. Run `terraform plan` to preview the changes.
2. Run `terraform apply` to create the GKE cluster.

### Prerequisites
- Ensure you have GCP credentials configured (e.g., via `GOOGLE_APPLICATION_CREDENTIALS` environment variable).
- Verify your GCP project has the necessary APIs enabled (e.g., Container API).

### Notes
- This setup assumes Terraform 1.0 or later and the Google provider.
- The configuration is minimal for demonstration. In a production environment, consider adding network configurations, IAM roles, and more robust node pool settings.
- Preemptible VMs are used for cost savings but can be replaced with standard VMs by setting `preemptible = false`.
