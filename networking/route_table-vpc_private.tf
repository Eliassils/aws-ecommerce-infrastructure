
resource "aws_route_table" "private" {
  count  = length(aws_subnet.private)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    # Adicionado [count.index] aqui para vincular cada NAT à sua tabela
    gateway_id     = aws_nat_gateway.this[count.index].id
  }

  tags = {
    # Adicionado [count.index] para identificar a AZ na Tag
    Name = "${var.vpc.name}-${var.vpc.private_route_table_name}-${aws_subnet.private[count.index].availability_zone}"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  # CORREÇÃO AQUI: Adicionado [count.index] para associar a tabela correta
  route_table_id = aws_route_table.private[count.index].id
}