provider "aws"{
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region ="${var.region}"
  }

data "aws_ami" "ami"{
	most_recent = true
	owners      = ["self"]
	filter{
		name = "tag:Name"
		values = ["${var.ami_name}"]
	}
}
	
data "aws_security_group" "sg" {
  name = "${var.security_group_name}"
}

resource "aws_instance" "compute"{
	ami = "${data.aws_ami.ami.id}"
	instance_type = "${var.instance_type}"
	vpc_security_group_ids = ["${data.aws_security_group.sg.id}"]
	associate_public_ip_address = true
	tags{
		Name = "Infra_Automation"
		Environment = "${var.environment}"
	}
}
