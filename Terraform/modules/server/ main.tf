resource "aws_security_group" "app" {
  name        = "${var.project_name}-app-sg"
  description = "Security group for application instances"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow application port"
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-app-sg"
    Project     = var.project_name
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "app" {
  count                  = var.instance_count
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = [aws_security_group.app.id]
  #user_data              = file("${path.module}/user_data.sh")

  # root_block_device {
  #   volume_size = 20
  #   volume_type = "gp2"
  # }

  tags = {
   Name    = count.index == 0 ? "jenkins-master" : "jenkins-slave"
    Project     = var.project_name
  }
}

# CloudWatch Alarm for CPU utilization
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  count               = var.instance_count
  alarm_name          = "${var.project_name}-cpu-alarm-${count.index + 1}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This alarm monitors EC2 CPU utilization"
  dimensions = {
    InstanceId = aws_instance.app[count.index].id
  }
  alarm_actions = [aws_sns_topic.alerts.arn]
}

# SNS Topic for CloudWatch Alarms
resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-alerts"
}