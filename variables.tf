
variable "aws-region"{
description = " The AWS region to create things"
default     = "us-east-2"
}

variable "key_name"{
  description = "SSH keys to connect to ec2 instance"
  default     = "ssh_key"
}

variable "instance_type"{
  description = "instance type for ec2"
  default     = "t2.micro"
}

variable "security_group"{
  description = "Name of the security-group"
  default     = "my-jenkins"
}

variable "tag_name"{
  description = "Tag Name of for Ec2 instance"
  default     = "server"
}

variable "ami_id"{
  description = "Ami for ubuntu ec2 instance"
  default     = "ami-002068ed284fb165b"
}
