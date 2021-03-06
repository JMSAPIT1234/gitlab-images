# == REQUIRED VARS

variable "name" {
  default = "eks"
  description = "Name of this EKS cluster"
}

variable "eks_version" {
  default = "1.18"
  description = "Version of this EKS cluster"
}

variable "cluster_arn" {
  default = "1.18"
  description = "Version of this EKS cluster"
}

variable "cluster_private_access" { #used
  default     = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "cluster_public_access" { #used
  default     = false
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "subnet_ids" {
  type        = list
  description = "List of private subnet IDs for EKS instances"
}

variable "ami_id" {
  default = ""
  description = "AMI of nodegroups"
}

variable "instance_type_1" {
  description = "Instance type for EKS workers (first priority)"
}

variable "instance_type_2" {
  description = "Instance type for EKS workers (second priority)"
}

variable "instance_type_3" {
  description = "Instance type for EKS workers (third priority)"
}

variable "on_demand_percentage" {
  description = "Percentage of on-demand intances vs spot"
  default     = 100
}

variable "on_demand_base_capacity" {
  description = "You can designate a base portion of your total capacity as On-Demand. As the group scales, per your settings, the base portion is provisioned first, while additional On-Demand capacity is percentage-based."
  default     = 0
}

variable "vpc_id" {
  description = "VPC ID to deploy the EKS cluster"
}

# variable "public_subnet_ids" {
#   type        = "list"
#   description = "List of public subnet IDs for EKS ALB"
# }

# variable "secure_subnet_ids" {
#   type        = "list"
#   description = "List of secure subnet IDs for EFS"
# }

variable "security_group_ids" {
  type        = list
  default     = []
  description = "Extra security groups for instances"
}

variable "userdata" {
  default     = ""
  description = "Extra commands to pass to userdata"
}

variable "asg_min" {
  default     = 1
  description = "Min number of instances for autoscaling group"
}

variable "asg_max" {
  default     = 4
  description = "Max number of instances for autoscaling group"
}

variable "alarm_sns_topics" {
  default     = []
  description = "Alarm topics to create and alert on EKS instance metrics"
}

variable "autoscaling_health_check_grace_period" {
  default     = 300
  description = "The length of time that Auto Scaling waits before checking an instance's health status. The grace period begins when an instance comes into service"
}

variable "autoscaling_default_cooldown" {
  default     = 300
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
}

variable "instance_volume_size" {
  description = "Volume size for docker volume (in GB)"
  default     = 20
}

variable "cloudwatch_logs_retention" {
  default     = 120
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653."
}

# variable "cloudwatch_logs_export" {
#   default     = false
#   description = "Whether to mark the log group to export to an S3 bucket (needs terraform-aws-log-exporter to be deployed in the account/region)"
# }