resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc11.id

  tags = {
    Name = "myig"
  }
}