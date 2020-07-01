###  Setup Simple Amazon S3 Bucket using Terraform

### Instructions : 

1. Create the AWS profile 
    ```bash
    aws configure --profile default
    ```
1. Update the variables values in the [terraform.tfvars](terraform.tfvars) file. 
    ```bash
    $ bat terraform.tfvars 
    ───────┬────────────────────────────────────────────
           │ File: terraform.tfvars
    ───────┼────────────────────────────────────────────
       1   │ aws_s3_bucket_name = "rao-ksm-chartmuseum"
       2   │ aws_region = "us-west-2"
       3   │ aws_profile = "default"
    ───────┴────────────────────────────────────────────
    ```

1. Provision the resources configured in the terraform config
    ```bash
    terraform init 
    terraform plan
    terraform apply 
    ```
    This will provision the S3 Bucket on AWS.

    ```bash
    $ terraform output     
    bucket_domain_name = rao-ksm-chartmuseum.s3.amazonaws.com
    bucket_id = rao-ksm-chartmuseum
    bucket_regional_domain_name = rao-ksm-chartmuseum.s3.us-west-2.amazonaws.com
    hosted_zone_id = Z3BJ6K6RIION7M
    region = us-west-2
    terraform_state_bucket = arn:aws:s3:::rao-ksm-chartmuseum
    ```



