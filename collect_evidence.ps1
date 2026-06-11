param(
  [string]VPC = "vpc-04498fe5b327ce56",
  [string]TFVARS = "terraform.tfvars"
)

# Création des dossiers
New-Item -ItemType Directory -Force -Path evidence | Out-Null
New-Item -ItemType Directory -Force -Path screenshots | Out-Null

Write-Host "--- 1. Validation ---" -ForegroundColor Cyan
terraform init; terraform validate

Write-Host "--- 2. Plan ---" -ForegroundColor Cyan
terraform plan -var-file="$TFVARS" -no-color > evidence/terraform_plan.txt

Write-Host "--- 3. Tentative d'Apply ---" -ForegroundColor Cyan
terraform apply -var-file="$TFVARS" -auto-approve > evidence/terraform_apply_output.txt 2>&1

Write-Host "--- 4. Collecte AWS ---" -ForegroundColor Cyan
aws ec2 describe-vpcs --vpc-ids $VPC --region eu-west-3 --output json > evidence/evidence_vpcs.json

Write-Host "--- 5. Création README ---" -ForegroundColor Cyan
"Rendu TP03 - etudiant10
Code valide, apply restreint par AWS Permissions Boundary." | Out-File -Encoding utf8 .\README.txt

Write-Host "C'est fini ! Tes fichiers texte sont dans le dossier /evidence." -ForegroundColor Green
