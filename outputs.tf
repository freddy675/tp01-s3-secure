output "instance_public_ip" {
  description = "Adresse IP publique de l'instance"
  value       = aws_instance.web.public_ip
}

output "instance_url" {
  description = "URL pour tester le serveur web"
  value       = "http://${aws_instance.web.public_ip}"
}
