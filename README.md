<!-- BEGIN_TF_DOCS -->
# Domain (Cloudflare)

Cloudflare Setup for a new SaaS Startup

Includes:

 - Cloudflare Zone
 - Cloudflare SSL Encryption
 - Cloudflare for Teams
 - Gmail MX Records
 - AWS SES

## Usage

```bash
locals {
  subdomains = [
    {
      name    = "@"
      value   = "longtld.elb.us-west-2.amazonaws.com"
      type    = "CNAME"
      proxied = true
    },
    {
      name    = "app"
      value   = "longtlkd.elb.us-west-2.amazonaws.com"
      type    = "CNAME"
      proxied = true
    }
  ]
}

module "parking" {
  source = "github.com/opszero/terraform-cloudflare-domain"
  domain = "example.com"
  records = local.subdomains
}
```

## Deployment

```sh
terraform init
terraform plan
terraform apply -auto-approve
```

## Teardown

```sh
terraform destroy -auto-approve
```
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access"></a> [access](#input\_access) | List of access applications | `list` | `[]` | no |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Cloudflare account id | `any` | n/a | yes |
| <a name="input_aws_ses_enabled"></a> [aws\_ses\_enabled](#input\_aws\_ses\_enabled) | Create AWS SES resources | `bool` | `false` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | domain for the webapp | `any` | n/a | yes |
| <a name="input_google_email_enabled"></a> [google\_email\_enabled](#input\_google\_email\_enabled) | Enable Google MX Records | `bool` | `true` | no |
| <a name="input_records"></a> [records](#input\_records) | List of DNS records | `list` | `[]` | no |
| <a name="input_ssl_forced"></a> [ssl\_forced](#input\_ssl\_forced) | Force SSL on Domains | `bool` | `true` | no |
## Resources

| Name | Type |
|------|------|
| [aws_ses_domain_dkim.dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.ses](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [cloudflare_access_application.access](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_application) | resource |
| [cloudflare_access_policy.support_policy](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_policy) | resource |
| [cloudflare_page_rule.ssl](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/page_rule) | resource |
| [cloudflare_record.dkim](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.mx](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.records](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.ses](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.spf](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.site](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
## Outputs

No outputs.
# 🚀 Built by opsZero!

<a href="https://opszero.com"><img src="https://opszero.com/wp-content/uploads/2024/07/opsZero_logo_svg.svg" width="300px"/></a>

Since 2016 [opsZero](https://opszero.com) has been providing Kubernetes
expertise to companies of all sizes on any Cloud. With a focus on AI and
Compliance we can say we seen it all whether SOC2, HIPAA, PCI-DSS, ITAR,
FedRAMP, CMMC we have you and your customers covered.

We provide support to organizations in the following ways:

- [Modernize or Migrate to Kubernetes](https://opszero.com/solutions/modernization/)
- [Cloud Infrastructure with Kubernetes on AWS, Azure, Google Cloud, or Bare Metal](https://opszero.com/solutions/cloud-infrastructure/)
- [Building AI and Data Pipelines on Kubernetes](https://opszero.com/solutions/ai/)
- [Optimizing Existing Kubernetes Workloads](https://opszero.com/solutions/optimized-workloads/)

We do this with a high-touch support model where you:

- Get access to us on Slack, Microsoft Teams or Email
- Get 24/7 coverage of your infrastructure
- Get an accelerated migration to Kubernetes

Please [schedule a call](https://calendly.com/opszero-llc/discovery) if you need support.

<br/><br/>

<div style="display: block">
  <img src="https://opszero.com/wp-content/uploads/2024/07/aws-advanced.png" width="150px" />
  <img src="https://opszero.com/wp-content/uploads/2024/07/AWS-public-sector.png" width="150px" />
  <img src="https://opszero.com/wp-content/uploads/2024/07/AWS-eks.png" width="150px" />
</div>
<!-- END_TF_DOCS -->