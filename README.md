# terraform

Contains Terraform configs for various projects.

## Provisioning GraphQL API

### Manual

#### AWS User Profile

- Ensure Terraform is installed on your local machine
- Ensure the AWS CLI is installed on your local machine
- Create AWS user called `proteus-user`
- Add `proteus-user` to group called `ProteusAdmin` which has `AdministratorAccess` permission
- Create a profile for this user:

```bash
aws configure --profile proteus-user
```

#### Authenticating to Docker

- View your current AWS account info by running: `aws sts get-caller-identity --profile proteus-user --output json`
  You should get an output like:

  ```bash
    {
        "UserId": "AIDARKDWH5GG473MZO65W",
        "Account": "090442295693",
        "Arn": "arn:aws:iam::090442295693:user/proteus-user"
    }
  ```

- Extract the Account ID into a variable called `ACCOUNT_ID`: `ACCOUNT_ID=$(aws sts get-caller-identity --profile proteus-user --output json | jq -r ".Account")`
  - You may need to install `jq`. On Mac: `brew install jq`
- Confirm the value of ACCOUNT_ID: `echo $ACCOUNT_ID`
- Login to AWS ECR:

```bash
aws ecr get-login-password --region eu-west-1 --profile proteus-user | docker login --username AWS --password-stdin "$ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com"
```

#### Pushing our Docker Image to ECR

- In the AWS Console, create a **private** ECR repository called `graphql_api`
- In the root directory of the `proteus-graphql-api` project, run: `docker build --target production -t proteus-graphql-api:latest .`
- `docker tag proteus-graphql-api:latest $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/graphql_api:latest`
- `docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/graphql_api:latest`

#### Provisioning GraphQL API Resources using Terraform

- `cd` into the `proteus/graphql-api` directory
- Ensure Terraform is initialized: `terraform init`
- Create a file called `env.tfvars` (from the template `env.example.tfvars`)
  - You can see the values of this file in our Bitwarden item `proteus/graphql-api/env.tfvars` (under the folder `Tech/DevOps`)
- In the file `proteus/graphql-api/0.variables.tf`, do **NOT** forget to set the `aws_account_id` variable to the right value.
- To see the resources to be provisioned: `terraform plan -var-file="env.tfvars"`
- To provision the resources: `terraform apply -var-file="env.tfvars"`

#### Accessing the GraphQL API

- Go to [https://eu-west-1.console.aws.amazon.com/ecs/v2/clusters/proteus_graphql_api_cluster/services/proteus_graphql_api_service/tasks?region=eu-west-1](https://eu-west-1.console.aws.amazon.com/ecs/v2/clusters/proteus_graphql_api_cluster/services/proteus_graphql_api_service/tasks?region=eu-west-1)
- Click on the running task

![Image](https://github.com/agnos-cloud/proteus-graphql-api/assets/6097630/74bb0699-db1d-45f7-97f4-c48e8c79c173)

- This loads the task page. The `Configuration` tab contains the public IP address of the GraphQL API Fargate instance.

![Image](https://github.com/agnos-cloud/proteus-graphql-api/assets/6097630/6bf60575-20d8-4db5-8476-fa679d00b30f)

- The `Logs` tab shows if the GraphQL API is running successfully.

![Image](https://github.com/agnos-cloud/proteus-graphql-api/assets/6097630/5f0b4c01-2ab5-4a65-a4af-41bcc797429f)

- The GraphQL API runs on port `3000`. The complete URL for the GraphQL API is `http://{Public IP}:3000/graphql`
- Remember to update all environment variables in all projects pointing to the GraphQL API.

## Resources

- [AWS Essentials](https://www.youtube.com/watch?v=CGFrYNDpzUM&list=PLv2a_5pNAko0Mijc6mnv04xeOut443Wnk&index=1)
- [Deploy NodeJs App on AWS Using Terraform and Docker](https://codelabs.transcend.io/codelabs/node-terraform/index.html?index=..%2F..index#0)
