###vpc_module
cidr                         = "10.0.0.0/16"
name                         = "vpc-module"
enable_dns_hostnames         =  false
enable_dns_support           =  true

 # subnet
Public_sn_cidr               = "10.0.0.0/24"
Private_sn_cidr_1            = "10.0.1.0/24"
public_subnet_az             = "us-east-1a"

 #

environment                  = "prod-module"

create-eip                   =  true
public_rt_cidr               = "0.0.0.0/0"
Private_rt_cidr              = "0.0.0.0/0"
#ami_fe                       = "ami-08c40ec9ead489470"
#ami_be                       = "ami-08c40ec9ead489470"
#ami_mysql                    = "ami-08c40ec9ead489470"
instance_type                = "t2.micro"
associate_public_ip_address  =  true
#subnet_grp_name              = "mysql-subnets"
keypair-name                 = "prod"
#Dynamodb_name                = "prod_dynamo-db"
#s3-bucket-name               = "prod-ems-ops-jumisa-statebackend"



 #IAM
iam-role-name                = "prod-iam-role"
iam-instance-profile-name    = "Prod-EC2_SSM_Instance_Profile"
