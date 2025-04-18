
module "network" {
  source = "./modules/network"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "server" {
   source = "./modules/server"

  project_name    = var.project_name
  instance_type   = var.instance_type
  key_name        = var.key_name
  vpc_id          = module.network.vpc_id
  subnet_ids      = module.network.public_subnet_ids
  instance_count  = 2
  app_port        = 8081
}

# Create CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.project_name}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", module.server.instance_ids[0]],
            ["AWS/EC2", "CPUUtilization", "InstanceId", module.server.instance_ids[1]]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "EC2 CPU Utilization"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "NetworkIn", "InstanceId", module.server.instance_ids[0]],
            ["AWS/EC2", "NetworkIn", "InstanceId", module.server.instance_ids[1]]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "EC2 Network In"
        }
      }
    ]
  })
}