variable "region" {
  type = string
  default = "us-east-1"
}
variable "assume_role" {
  type = object({
    role_arn = string
  })
  default = {
    role_arn = "arn:aws:iam::846863293650:role/terraform-role"
  }
  
}

variable "vpc" {
  type = object({
    name = string
    cidr_block = string
    internet_gateway_name = string
    public_route_table_name =string
    private_route_table_name = string
    nat_gateway_name= string
    eip_name =string
    public_subnets = list(object({
      name = string
      cidr_block = string
      availability_zone = string
      map_public_ip_on_lauch =bool
    }))

    private_subnets = list(object({
      name = string
      cidr_block = string
      availability_zone = string
      map_public_ip_on_lauch =bool
    }))
  })
  default = {
    name = "nsse-vpc"
    cidr_block = "10.0.0.0/24"
    internet_gateway_name = "internet-gateway"
    public_route_table_name = "public-route-table"
    private_route_table_name = "private-route-table"
    nat_gateway_name = "nat-gateway"
    eip_name = "nat-gateway-eip"
    public_subnets = [ {
      name = "public-subnet-us-east-1a"
      cidr_block ="10.0.0.0/27"
      availability_zone ="us-east-1a"
      map_public_ip_on_lauch = true
    },
    {
      name ="public-subnet-us-east-1b"
      cidr_block ="10.0.0.64/27"
      availability_zone = "us-east-1b"
      map_public_ip_on_lauch = true
    } ]

     private_subnets = [ {
      name = "private-subnet-us-east-1a"
      cidr_block ="10.0.0.32/27"
      availability_zone ="us-east-1a"
      map_public_ip_on_lauch = false
    },
    {
      name ="private-subnet-us-east-1b"
      cidr_block ="10.0.0.96/27"
      availability_zone = "us-east-1b"
      map_public_ip_on_lauch = false
    } ]

  }
}