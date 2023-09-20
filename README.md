# TF-Apache-Beginner

## Overview

- Beginner Project to help get experience with Terraform
- Create an EC2 Instance along with a custom VPC and subnet. Assign a Public IP to the EC2 Instance
- Deploy an Apache Web Server on the instance
- Allow SSH, HTTP and HTTPS access to the instance

## Steps

1. Create a Key Pair
2. Create a VPC
3. Create an Internet Gateway
4. Create a custom Route Table
5. Create a Subnet
6. Associate subnet with Route Table
7. Create a Security Group to allow ports 22, 80 and 443
8. Create a network interface with an IP in a subnet that was created in step 5
9. Assign an Elastic IP address to the network interface created in step 8
10. Create an Ubuntu server and install/enable Apache2
