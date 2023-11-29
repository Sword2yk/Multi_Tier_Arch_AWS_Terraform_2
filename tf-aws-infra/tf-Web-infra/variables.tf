variable "launch-template-web-name" {
  description = "Name for Launch-template-1"
}

variable "image-id" {
  description = "Value for Image-id"
}

variable "instance-type" {
  description = "Value for Instance type"
}

variable "key-name" {
  description = "Value for Key name"
}

variable "web-instance-name" {
  description = "Value for Web Instances"
}

variable "alb-web-name" {
  description = "Name the Load Balancer for the Web Tier"
}

variable "alb-sg-web-name" {
  description = "Name for alb security group 1"
}

variable "asg-web-name" {
  description = "Name the Auto Scaling group in Web Tier"
}

variable "asg-sg-web-name" {
  description = "Name for asg security group 1"
}

variable "tg-web-name" {
  description = "Name for Target group web"
}
