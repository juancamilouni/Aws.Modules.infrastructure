output "asg_name" {
  description = "Auto Scaling Group name."
  value       = aws_autoscaling_group.this.name
}

output "asg_arn" {
  description = "Auto Scaling Group ARN."
  value       = aws_autoscaling_group.this.arn
}

output "launch_template_id" {
  description = "Launch Template ID."
  value       = aws_launch_template.this.id
}

output "launch_template_arn" {
  description = "Launch Template ARN."
  value       = aws_launch_template.this.arn
}

output "launch_template_latest_version" {
  description = "Latest Launch Template version."
  value       = aws_launch_template.this.latest_version
}

output "iam_role_name" {
  description = "IAM role name attached to EC2 instances."
  value       = aws_iam_role.this.name
}

output "iam_role_arn" {
  description = "IAM role ARN attached to EC2 instances."
  value       = aws_iam_role.this.arn
}

output "instance_profile_name" {
  description = "IAM instance profile name."
  value       = aws_iam_instance_profile.this.name
}

output "instance_profile_arn" {
  description = "IAM instance profile ARN."
  value       = aws_iam_instance_profile.this.arn
}