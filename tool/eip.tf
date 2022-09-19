resource "aws_eip" "eip" {
  tags = {
    Name = "eip1"
  }
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.sub-pub.0.id
  tags = {
    Name = "NAT"
  }
}
    
  