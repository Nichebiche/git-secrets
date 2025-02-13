# Deploying a LAMP Stack using AWS CloudFormation

This guide provides instructions for deploying a LAMP (Linux, Apache, MySQL, PHP) stack using AWS CloudFormation. The stack will be created using a single EC2 instance and a local MySQL database for storage.

## Prerequisites

Before you begin, ensure you have the following:

* An AWS account
* AWS CLI installed and configured
* A key pair for accessing the EC2 instance

## Steps to Deploy the LAMP Stack

1. **Create the CloudFormation Stack**

   Use the provided CloudFormation template to create the LAMP stack. The template is located at `cloudformation/lamp-stack.yaml`.

   ```bash
   aws cloudformation create-stack --stack-name LampStack --template-body file://cloudformation/lamp-stack.yaml --parameters ParameterKey=KeyName,ParameterValue=<your-key-pair-name>
   ```

   Replace `<your-key-pair-name>` with the name of your key pair.

2. **Wait for the Stack to be Created**

   Monitor the stack creation process. You can use the AWS Management Console or the AWS CLI to check the status of the stack.

   ```bash
   aws cloudformation describe-stacks --stack-name LampStack
   ```

   Wait until the stack status is `CREATE_COMPLETE`.

3. **Access the PHP Info Page**

   Once the stack is created, you can access the PHP info page to verify the installation. The URL of the PHP info page is provided in the stack outputs.

   ```bash
   aws cloudformation describe-stacks --stack-name LampStack --query "Stacks[0].Outputs[?OutputKey=='WebsiteURL'].OutputValue" --output text
   ```

   Open the URL in a web browser to see the PHP info page.

## CloudFormation Template

The CloudFormation template `cloudformation/lamp-stack.yaml` defines the resources required for the LAMP stack, including an EC2 instance, security group, and IAM role. The user data script in the template installs Apache, PHP, and MySQL on the EC2 instance.

## Shell Script for LAMP Installation

The shell script `scripts/install-lamp.sh` is used to install Apache, PHP, and MySQL on the EC2 instance. The script performs the following actions:

* Updates the package repository and installs necessary packages
* Starts and enables Apache and MySQL services
* Secures the MySQL installation
* Creates a PHP info file to test the PHP installation

You can find the script at `scripts/install-lamp.sh`.
