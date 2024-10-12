# Key Take Away

## Hands On

- Learnt how to create a module to standardize the creation of ec2 instances

## Module

- Basically a "library" and has the following advantages:
  - **Modularity** -> More of a decoupled architecture, have smaller self-contained components, easier to manage
  - **Reusability** -> Instead of rewriting similar configuration for multiple different Terraform Projects, create reusable templates
  - **Easier collaboration** -> Different team members can work on different modules
  - **Versioning & control** -> Each module can have it's own versions, if a new version of a module is release you have the option of not using it
  - **Abstraction**
  - **Testing** -> can test individual modules separately
  - **Scalability**
  - **Security & Compliance** -> e.g. Create an ec2 instance launch template for IAM roles, security groups, etc.
