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
