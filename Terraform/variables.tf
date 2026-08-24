variable "bucket_name" {
  description = "Nome do bucket S3 da aplicação"
  type        = string

  default = "desafio-fluxo-fap"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string

  default = "t2.micro"
}

variable "ami_id" {
  description = "AMI utilizada pela EC2"
  type        = string

  default = "ami-0c55b159cbfafe1f0"
}
