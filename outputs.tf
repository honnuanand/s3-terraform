output "terraform_state_bucket" {
  value = aws_s3_bucket.the_bucket.arn
}

# output "dynamodb_tf_state_lock_tablename" {
#   value = aws_dynamodb_table.terraform_locks.name
# }
output "bucket_domain_name" {
  value = aws_s3_bucket.the_bucket.bucket_domain_name 
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.the_bucket.bucket_regional_domain_name 
}

output "hosted_zone_id" {
  value = aws_s3_bucket.the_bucket.hosted_zone_id
}

output "bucket_id" {
  value = aws_s3_bucket.the_bucket.id
}

output "region" {
  value = aws_s3_bucket.the_bucket.region
}