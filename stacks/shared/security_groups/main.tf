provider "aws"{
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region ="${var.region}"
  }

resource "aws_security_group" "security_group" {
  name        = "aws_infra_automation_sg"
  description = "sg for aws_infra_automation project"
 
 tags{
		Name = "Infra_Automation"
		Environment = "${var.environment}"
	}
}

resource "aws_security_group_rule" "ingress_rule" {
  description = "ingress rule for aws_infra_automation project"

  type      = "ingress"
  from_port = 0  
  to_port   = 65535
  protocol  = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "egress_rule" {
  description = "egress rule for aws_infra_automation project"

  type      = "egress"
  from_port = 0
  to_port   = 65535
  protocol  = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
  security_group_id  = "${aws_security_group.security_group.id}"
}
