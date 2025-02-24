resource "aws_instance" "db" {                                               #syntax of instance name don't chamge it
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow.id]                     #security group are list that why we kept []*
  instance_type = "t3.micro"

    tags = {                                                                 # {} flower brucket started that why tags are we called as maps
        Name = "helloWorld"
        module = "database"                                                  # name is db instance name it is map ...   #what ever we keep in tags will create instance name
    } 
}

       # key = value


resource "aws_security_group" "allow" {                                      #need to write at vpc_security_group_ids
    name = "allow"
    description = "allowing SSH access"

    #terraform block
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow"
        CreatedBy = "Sandeep"
    }
}
