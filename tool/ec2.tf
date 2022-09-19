resource "aws_instance" "foo" {
  count                   = length(var.pub-cidr)
  ami                   = lookup(var.amis, var.region)
  instance_type         = "t2.micro"
  subnet_id             = element(aws_subnet.sub-pub.*.id, count.index)
  key_name              = var.key_name
  vpc_security_group_ids = ["${aws_security_group.allow.id}"]
  tags = {
    Name = "myec2-${count.index + 1}"
  }
}

resource "aws_instance" "ravi" {
  count                   = length(var.pvt-cidr)
  ami                   = lookup(var.amis, var.region)
  instance_type         = "t2.micro"
  subnet_id             = element(aws_subnet.sub-pvt.*.id, count.index)
  key_name              = var.key_name
  vpc_security_group_ids = ["${aws_security_group.allow.id}"]
  tags = {
    Name = "pvt2-${count.index + 1}"
  }
}

