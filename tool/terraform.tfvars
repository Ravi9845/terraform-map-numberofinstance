region = "us-east-1"
# access_key = "AKIA4GL543ONGYGGEQYB"
# secret_key = "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"
pub-cidr = ["10.0.0.16/28"]
pvt-cidr = ["10.0.0.0/28"]
az   = ["us-east-1a", "us-east-1b"]
# ami  = "ami-0568773882d492fc8"
key_name  = "demo"
amis = {
    us-east-2 = "ami-0568773882d492fc8"
    us-east-1 = "ami-05fa00d4c63e32376"
}
# az = {
#     us-east-2 = ["us-east-2a", "us-east-2b"]
#     us-east-1 = ["us-east-1a", "us-east-1b"]
# }