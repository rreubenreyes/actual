module "server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "actual_server"
  instance_type          = "t2.micro"
  ami                    = "ami-052c9ea013e6e3567" # Amazon Linux 2023
  key_name               = aws_key_pair.minecraft_server.id
  vpc_security_group_ids = [aws_security_group.this.id]

  disable_api_termination = true
}

resource "aws_key_pair" "server" {
  lifecycle {
    ignore_changes = [public_key]
  }

  key_name   = "actual_server"
  public_key = var.ec2_public_key
}
