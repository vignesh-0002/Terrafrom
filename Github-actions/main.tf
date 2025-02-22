module "vpc"{
       source                       = "./modules/VPC"
       cidr                         = var.cidr
       name                         = var.name
       environment                  = var.environment
       enable_dns_hostnames         = var.enable_dns_hostnames
       enable_dns_support           = var.enable_dns_support
       tags                         = var.tags
       Public_sn_cidr               = var.Public_sn_cidr
       Private_sn_cidr_1            = var.Private_sn_cidr_1
       public_subnet_az             = var.public_subnet_az
       public_rt_cidr               = var.public_rt_cidr
       Private_rt_cidr              = var.Private_rt_cidr
       #create-eip                   = var.create-eip
}



module "session-manager-settings" {
  source                            = "./modules/IAM"
  iam-role-name                     = var.iam-role-name 
  iam-instance-profile-name         = var.iam-instance-profile-name
}


module "security_group" {
       source                       = "./modules/SG"
       vpc_id                       = module.vpc.vpc_id
       name                         = var.name
       environment                  = var.environment
       tags                         = var.tags
}


module "ec2" {
      source                       = "./modules/EC2"
      Public_subnet_id             = module.vpc.Public_subnet_id
      public_sg                    = module.security_group.public_sg 
      Private_subnet_id            = module.vpc.Private_subnet_id 
      private_sg                   = module.security_group.private_sg
      
      ec2_instance_profile         = module.session-manager-settings.ec2_instance_profile
      name                         = var.name
      environment                  = var.environment
      tags                         = var.tags
      ami_fe                       = var.ami_fe
      ami_be                       = var.ami_be
      ami_mysql                    = var.mysql
      instance_type                = var.instance_type
      associate_public_ip_address  = var.associate_public_ip_address 
      keypair-name                 = var.keypair-name  
}    
