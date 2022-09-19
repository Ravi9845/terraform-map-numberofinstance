resource "aws_route_table" "pub1" {
  vpc_id = aws_vpc.myvpc11.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "pub1"
  }
}

resource "aws_route_table_association" "route" {
  count                   = length(var.pub-cidr)
  subnet_id      = element(aws_subnet.sub-pub.*.id, count.index)
  route_table_id = aws_route_table.pub1.id
}

resource "aws_route_table" "pvt1" {
  vpc_id = aws_vpc.myvpc11.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
  tags = {
    Name = "pvt1"
  }
}

resource "aws_route_table_association" "route1" {
  count                   = length(var.pvt-cidr)
  subnet_id      = element(aws_subnet.sub-pvt.*.id, count.index)
  route_table_id = aws_route_table.pub1.id
}