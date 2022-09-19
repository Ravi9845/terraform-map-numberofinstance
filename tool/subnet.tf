resource "aws_subnet" "sub-pub" {
  count                   = length(var.pub-cidr)
  vpc_id                  = aws_vpc.myvpc11.id
  cidr_block              = element(var.pub-cidr, count.index)
  availability_zone       = element(var.az, count.index)
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public-${count.index + 1}"
  }
}

resource "aws_subnet" "sub-pvt" {
  count                   = length(var.pvt-cidr)
  vpc_id                  = aws_vpc.myvpc11.id
  cidr_block              = element(var.pvt-cidr, count.index)
  availability_zone       = element(var.az, count.index)
  map_public_ip_on_launch = "true"
  tags = {
    Name = "pvt-${count.index + 1}"
  }
}