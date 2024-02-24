resource "aws_security_group" "this" {
  name = "actual_server"
}

resource "aws_security_group_rule" "default_ingress" {
  security_group_id = aws_security_group.this.id

  type      = "ingress"
  protocol  = "-1"
  from_port = 0
  to_port   = 0
  self      = true
}

resource "aws_security_group_rule" "ssh_ingress" {
  security_group_id = aws_security_group.this.id

  type      = "ingress"
  protocol  = "tcp"
  from_port = 22
  to_port   = 22
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}

resource "aws_security_group_rule" "default_egress" {
  security_group_id = aws_security_group.this.id

  type      = "egress"
  protocol  = "-1"
  from_port = 0
  to_port   = 0
  cidr_blocks = [
    "0.0.0.0/0"
  ]
}
