
## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| create_admin_user | Create a CI admin user | `false` | no |
| create_readonly_user | Create a CI readonly user | `false` | no |
| create_tokens_user | Create a user with access to manage a K8s tokens file in S3 | `false` | no |
| dns_zone | The Route53 hosting zone for this cluster | `` | no |
| environment | The unique environment being created e.g. dev, production etc | - | yes |
| kops_state_bucket | The name of the kops state bucket (required for S3 tokens access) | `` | no |
| terraform_lock_table | The terraform bucket name used for state, required for terraform plan permissions | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns_zone |  |
| environment |  |
| user_admin |  |
| user_readonly |  |
| user_tokens |  |

