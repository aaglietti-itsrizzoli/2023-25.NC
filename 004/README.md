# 004 IAM

## Terraform console
https://developer.hashicorp.com/terraform/cli/commands/console

### REPL it!

`file("${path.module}/gcp_viewers.csv")`

`csvdecode(file("${path.module}/gcp_viewers.csv"))`

## IAM member
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_member

### After you add yourself you can access
https://console.cloud.google.com/iam-admin/iam?hl=it&project=exalted-pattern-424313-j3

## for_each
https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

## for expression
https://developer.hashicorp.com/terraform/language/expressions/for
