# Key Take Away

## Hands on

- Configured "Remote backend" in S3 to store terraform statefile
- Configured a DynamoDB table to enable state locking of the statefile (to prevent concurrent access of state file)

## State File

- Think of it like a "snapshot" of your infrastructure.
- Advantages:

  - Ease of update -> if a change is made, only apply the difference between the previous "snapshot" state and the new state
  - Collaboration -> State file ensures that everyone working on the same project shares the same infrastructure

- Drawbacks of statefile:

  - Senstive data being stored locally
  - Errors in collaboration -> e.g. if someone forgets to push the statefile to Git (raising conflict errors)

- BUT, these drawbacks are resolved using **Remote Backend**:
  - Remote Backend -> make the statefile remote (store it in S3)
  - Therefore, anyone that makes a "Terraform Apply" the statefile in S3 automatically gets updated
    - Collaboration -> Everyone one now will always share the same statefile
    - Sensitivity -> Not longer stored locally by all developers
