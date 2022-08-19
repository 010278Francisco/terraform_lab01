

variable "acces_key"{
  default     = "AKIAQ2C4ISCQXKQ42HHW"
}


variable "secret_key"{
  default     = "xwTQXa7kaaq5n5/zGdMjZNUt2NcJ7X/PbR1E6n25"
}

variable "aws_region"{
  description = " The AWS region to create things"
  default     = "us-west-2"
}


variable "key_name"{
  description = "SSH keys to connect to ec2 instance"
  default     = "ssh"
}

variable "instance_type"{
  description = "instance type for ec2"
  default     = "t2.micro"
}

variable "security_group"{
  description = "Name of the security-group"
  default     = "my-jenkins-security-group"
}

variable "tag_name"{
  description = "Tag Name of for Ec2 instance"
  default     = "server"
}

variable "ami_id"{
  description = "Ami for ubuntu ec2 instance"
  default     = "ami-0022f774911c1d690"
}
