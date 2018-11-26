/*
#root/elb.tf 

#
# Load Balancers. Uses the instance module outputs.
#

# Public Backend ELB
resource "aws_elb" "backend" {
  name            = "elb-public-backend"
  subnets         = ["${aws_subnet.public.id}", "${aws_subnet.private.id}"]
  security_groups = ["${aws_security_group.elb.id}"]
  instances       = ["${module.backend_api.instance_ids}"]

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
    target              = "HTTP:80/healthcheck.php"
    interval            = 30
  }
}

# Public Frontend ELB
resource "aws_elb" "frontend" {
  name            = "elb-public-frontend"
  subnets         = ["${aws_subnet.public.id}", "${aws_subnet.private.id}"]
  security_groups = ["${aws_security_group.elb.id}"]
  instances       = ["${module.frontend.instance_ids}"]

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
    target              = "HTTP:80/healthcheck.php"
    interval            = 30
  }
}

# Private ELB for MySQL cluster
resource "aws_elb" "db_mysql" {
  name = "elb-private-galera"

  subnets         = ["${aws_subnet.private.id}"]
  security_groups = ["${aws_security_group.default.id}"]
  instances       = ["${module.db_mysql.instance_ids}"]
  internal        = true

  listener {
    instance_port     = 3306
    instance_protocol = "tcp"
    lb_port           = 3306
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:9222/" # Galera Clustercheck listens on HTTP/9222
    interval            = 30
  }
}
*/