resource "aws_instance" "jenkins_master" {
  ami                    = var.jenkins_master_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = "jenkins-key" 
  associate_public_ip_address = true
  tags = {
    Name = "Jenkins Master"
  }

  # CloudWatch monitoring
  monitoring = true
}

resource "aws_instance" "jenkins_slave" {
  ami                    = var.jenkins_slave_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = "jenkins-key" 
  associate_public_ip_address = true
  monitoring = true

  tags = {
    Name = "Jenkins Slave"
  }
}

# CloudWatch Alarms for EC2 Instances
resource "aws_cloudwatch_metric_alarm" "jenkins_master_cpu_alarm" {
  alarm_name          = "jenkins-master-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors Jenkins master CPU utilization"
  
  dimensions = {
    InstanceId = aws_instance.jenkins_master.id
  }
}

resource "aws_cloudwatch_metric_alarm" "jenkins_slave_cpu_alarm" {
  alarm_name          = "jenkins-slave-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors Jenkins slave CPU utilization"
  
  dimensions = {
    InstanceId = aws_instance.jenkins_slave.id
  }
}

