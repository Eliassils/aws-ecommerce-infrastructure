resource "aws_eip" "this" {  # Adicione o "i" aqui para virar "this"
  count = length(aws_subnet.public)

  domain = "vpc"
  tags = {Name ="${var.vpc.eip_name}-${aws_subnet.public[count.index].availability_zone}"}
}