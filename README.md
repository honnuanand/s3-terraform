###  Setup Simple Amazon S3 Bucket using Terraform

### Instructions : 

1. Create the AWS profile 
    ```bash
    aws configure --profile default
    ```
1. We need to execute the initial run of terraform with local storage for the state. The provider config will look like this : 
    ```json
    provider "aws" {
      region = var.aws_region
      profile = var.aws_profile
    }
    
    terraform {
    
    }
    ```
1. Provision the resources configured in the terraform config
    ```bash
    terraform init 
    terraform plan
    terraform apply 
    ```
    This will provision the S3 Bucket and the locking table on AWS.
1. Update the provider config with the contents of the [config/provider.tf](config/provider.tf)
    ```bash
    $ bat config/provider.tf
    ───────┬────────────────────────────────────────────────────────
           │ File: config/provider.tf
    ───────┼────────────────────────────────────────────────────────
       1   │ provider "aws" {
       2   │   region = "us-west-2"
       3   │   profile = "default"
       4   │ }
       5   │ 
       6   │ terraform {
       7   │   backend "s3" {
       8   │     # Replace this with your bucket name!
       9   │     bucket         = "rao-tf-state"
      10   │     key            = "global/s3/terraform.tfstate"
      11   │     region         = "us-west-2"
      12   │     # Replace this with your DynamoDB table name!
      13   │     dynamodb_table = "tf-state-locks"
      14   │     encrypt        = true
      15   │   }
      16   │ }
    ───────┼────────────────────────────────────────────────────────
    ```
    ```bash
    $ terraform init 
    
    Initializing the backend...
    Do you want to copy existing state to the new backend?
      Pre-existing state was found while migrating the previous "local" backend to the
      newly configured "s3" backend. No existing state was found in the newly
      configured "s3" backend. Do you want to copy this state to the new "s3"
      backend? Enter "yes" to copy and "no" to start with an empty state.
    
    $ terraform apply -auto-approve
    ...
    ...
    ```
    This will copy the terraform.tfstate to the S3 bucket under the `global/s3/terraform.tfstate` folder.
1. You can now (re)move local state file and see no change in behaviour. 



#### Include the provider config for terrform in all future terraform projects. Make sure to change the key to avoid any overrites. 

#### The lock allows you to share the remote state with multiple users without fearing any mess on the state file