module "sg" {
  source = "git::https://github.com/gouravhashi/acme-tf-demo.git//modules/sg?ref=main"
}
module "web_sg" {
  source               = "gouravhashi/sg/aws"
  version              = "1.0.0"
  name                 = "web-sg"
  description          = "Security group for web servers"
  vpc_id               = "vpc-123456"
  ingress_from_port    = 80
  ingress_to_port      = 80
  ingress_protocol     = "tcp"
  ingress_cidr_blocks  = ["0.0.0.0/0"]
  tags = {
    Name = "web-sg"
  }
}
