# Key Take aways

## Hands on

- Created workspace for different enviornments (dev, stage, prod)
- The main terraform script will create ec2 instance based on the current workspace

## Workspaces

- Allows you to manage multiple environment in a single configuration
- Each workspace will have it's own workspace
- Creating a work space: `terraform workspace new <name>`
- Switching work space: `terraform workspace select <name>`
