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



