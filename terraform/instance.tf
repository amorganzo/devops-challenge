#node provisioning

resource "aws_instance" "node" {
  ami           = "${var.AMIS}"
  instance_type = "${var.INSTANCE_TYPE}"
  key_name = "tbkey"
  count = 3  
  security_groups = ["${aws_security_group.TB-SG.id}"]
  subnet_id = "subnet-5c70c925"
  tags{
    Name = "${var.INSTANCE_NAME}"
      }

}

#security_group

resource "aws_security_group" "TB-SG" {
  vpc_id = "vpc-adb3e1d4"
  name = "webserver SG"
  description = "security group that allows incoming traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 

ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }


}


# Create a new load balancer

resource "aws_elb" "tbloadbalancer" {
  name               = "tbloadbalancer"
  availability_zones = ["us-west-2a"]
  security_groups = ["${aws_security_group.TB-SG.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${aws_instance.node.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "tbloadbalancer"
  }
}






#output
output "ip" {
    value = "${aws_instance.node.*.public_ip}"
      }

