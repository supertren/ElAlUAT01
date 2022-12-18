module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-${var.environment}-${var.vpc_name}"
  cidr = "${var.cidr}"

  azs             = ["${var.azs1}", "${var.azs2}", "${var.azs3}"]
  private_subnets = ["${var.Private-1a}", "${var.Private-1b}", "${var.Private-1c}"]
  public_subnets  = ["${var.Public-1a}", "${var.Public-1b}", "${var.Public-1c}"]
# intra_subnets =   ["10.0.51.0/24", "10.0.52.0/24", "10.0.53.0/24"]
  
  enable_nat_gateway = true
# enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.environment
    project_name = var.project_name
    vpc_name = var.vpc_name #am-dev
  }
}
