module "server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name          = "actual_server"
  instance_type = "m5a.large"
  # TODO: is this appropriate?
  ami                    = "ami-03d5c68bab01f3496"
  key_name               = aws_key_pair.minecraft_server.id
  vpc_security_group_ids = [aws_security_group.this.id]

  disable_api_termination = true
}

resource "aws_key_pair" "server" {
  lifecycle {
    ignore_changes = [public_key]
  }

  key_name = "minecraft_server"
  # TODO: change this
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCWDS6JMwH2eZpnggN7HcbOOrMAJzU4nKCDUYfcXnTtPHRgWuFhG2DN1GkM+huhKOyYW6Raaa7tcWU55i3AS560PPbNRBZfjSujIMKnhJbXfNzb9IrN5hsZPKJ0Oc463gIakxsYvd93rgTDz2maYoJvw2vUYBy3C2ngqDzlZ91ITqm6cyeCM8f/OPgfwFy8rCpQJg4AKpi+i5jfGYAvs/tIE6hkyhw9d6JJ7Dp2a/WIRkyeSqyoCDLgGsQtI2UGPDJdjKiznuBd/W9JeG5VqVaNNtvtwe7c/cIWl2eRFiNqmUJvMI6sKVPnCQBr3wmTdEEV5Ajk+LcN4ZCz0mdKdqf7"
}
