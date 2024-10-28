terraform init \
  -backend-config="address=$TF_ADDRESS" \
  -backend-config="lock_address=$TF_ADDRESS/lock" \
  -backend-config="unlock_address=$TF_ADDRESS/lock" \
  -backend-config="username=$TF_USERNAME" \
  -backend-config="password=$TF_PASSWORD" \
  -backend-config="lock_method=POST" \
  -backend-config="unlock_method=DELETE" \
  -backend-config="retry_wait_min=5"

  ## Uses Terraform init command to configure backend.
  ## Sets backend address, credentials, and lock settings.
  ## Facilitates secure and reliable Terraform state management
