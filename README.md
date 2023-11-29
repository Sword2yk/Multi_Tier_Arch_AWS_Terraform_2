# Deploy a scalable and resilient multi-tier architecture on AWS using Terraform.

## Terraform
Terraform is an infrastructure as a code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle.

## Multi-Tier Architecture Overview
A multi-tier architecture typically consists of three layers: a presentation layer (webserver), an application layer (app server), and a data layer (database server). Each layer serves a specific purpose and can be scaled independently, providing flexibility and efficiency.

### Web Tier -
This tier handles incoming user requests and can be horizontally scaled for increased capacity. It typically includes web servers and a load balancer for distributing traffic.

### Application Tier -
Application servers run our business logic and interact with the database tier. They can also be horizontally scaled to meet demand.

### Database Tier -
The database stores and manages our application data. In this architecture, we use Amazon RDS for a managed database service.

## Features
- High Availability: The architecture is designed for fault tolerance and redundancy.
- Scalability: Easily scale the web and application tiers to handle varying workloads.
- Security: Security groups and network ACLs are configured to ensure a secure environment.

## Terraform Configuration
The Terraform configuration for this project is organized into different sections and resources to create the necessary AWS infrastructure components.<br>

Key resources include:
- Virtual Private Cloud (VPC)
- Subnets and Route Tables
- Security Groups and Network ACLs
- Load Balancers
- Auto Scaling Groups
- RDS Database Instances

## Deployment VPC & Subnets

### Providers
A provider in Terraform is a plugin that enables interaction with an API. This includes Cloud providers and Software-as-a-service providers. The providers are specified in the Terraform configuration code.<br>

```hcl
     provider "aws" {
    region = var.region-name
    }
```

## VPC
Amazon Virtual Private Cloud (Amazon VPC) gives you full control over your virtual networking environment, including resource placement, connectivity, and security. Get started by setting up your VPC in the AWS service console.<br>

### Steps for VPC & Subnets
- Create a VPC ```vpc.tf```.
- Create three Subnets: Create subnets for each tiers ```web-subnets.tf``` , ```app-subnets.tf``` & ```db-subnets.tf```.
- Create a Internet gateway ```internet-gw.tf```.
- Create a NAT Gateway: Before going to create a NAT Gateway, We need Elastic IP ```eip.tf``` for creating NAT gateway ```nat-gw.tf```.
- Create a Route Table and make the Route table association. ```public-rt.tf``` file for creating a Route table for Web Subnets & ```private-rt.tf``` file for creating a Route table for App Subnets, So the Application Severs can be able to connect to the Internet.

## Deployment Web Tier
The Web Tier is the entry point for incoming user requests.
- Load Balancer: Distributes traffic across multiple web servers.
- Auto Scaling: Automatically adjusts the number of web servers based on traffic.
- Security Groups: Controls incoming and outgoing traffic to the web servers.

### Steps for Web Tier Configurations
- Create a ```lauch-template-web.tf``` file for creating a Launch template for ASG in the Web tier.
- Create a ```user-data.sh``` script file file for user data.
- Create a ```alb-web.tf``` file for creating an Application Load balancer for the Web tier.
- Create a ```tg-web.tf``` file for creating Target Group Configuration for the Load balancer.
- Create a ```asg-web.tf``` file for creating an Auto Scaling Group for the Web tier.
- Create a ```alb-sg-web.tf``` file for creating Security Group Configuration for the Load balancer.
- Create a ```asg-sg-web.tf``` file for creating Security Group Configuration for Auto Scaling Group.

## Deployment App Tier
The Application Tier hosts the application servers responsible for running business logic and interacting with the database tier.
- Application Servers: These run your application code and can be horizontally scaled.
- Load Balancer: Distributes traffic to the application servers.
- Auto Scaling: Automatically adjusts the number of web servers based on traffic.
- Security Groups: Controls incoming and outgoing traffic to the application servers.

### Steps for App Tier Configurations
- Create a ```lauch-template-app.tf``` file for creating a Launch template for ASG in the App tier.
- Create a ```alb-app.tf``` file for creating an Application Load balancer for the App tier.
- Create a ```tg-app.tf``` file for creating Target Group Configuration for the Load balancer.
- Create a ```asg-web.tf``` file for creating an Auto Scaling Group for the Web tier.
- Create a ```alb-sg-app.tf``` file for creating Security Group Configuration for the Load balancer.
- Create a ```asg-sg-app.tf``` file for creating Security Group Configuration for Auto Scaling Group.

## Deployment Database Tier
The Database Tier stores and manages our application data. We use Amazon RDS for a managed database service.<br>
- Amazon RDS: A managed database service for MySQL/PostgreSQL/SQL Server databases.
- Security Groups: Control incoming and outgoing traffic to the database.

### Steps for Database Tier Configurations
- Create a ```db-subnet-group.tf``` file for creating DB Subnet Group for our RDS Database.
- Create a ```rds.tf``` file for creating an RDS Database.
- Create a ```db-sg.tf``` file for creating Security Group Configuration for RDS.

## Terraform Deployment

- Create a ```variables.tf``` file for Variables Declaration.
- Create a ```terraform.tfvars``` file for Assigning Values to Variables.
- Create a ```secret.tfvars``` file for Assigning Values to Username and Password Variables.

## Output 
- Create a ```output.tf``` file for getting Web Server ALB DNS as Output.


## Remote Backend Configuration
- Create a ```backend.tf``` file for the Remote Backend.

## Deploying the Architecture
- ``terraform init`` (Initialize the terraform directory).
- ``terraform plan -var-file=secret.tfvars`` (Resources to be created).
- ``terraform apply -var-file=secret.tfvars``  (Creating Resources in AWS).

## Resource Creation Verification
Log into your AWS account and check whether our resources are created or not.<br>

## Multi-Tier Architecture Verification
- Paste the Output DNS into your browser and check whether our Web application is running or not.
- Try to log into Application Servers through our Web Servers using SSH.
- Try to log into MySQL Server from the Application Server.
