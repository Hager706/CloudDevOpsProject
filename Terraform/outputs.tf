output "jenkins_master_public_ip" {
  value = module.jenkins_servers.jenkins_master_public_ip
}

output "jenkins_slave_public_ip" {
  value = module.jenkins_servers.jenkins_slave_public_ip
}
