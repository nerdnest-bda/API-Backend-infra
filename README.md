
# Deploying Nerd Nest API to AWS ECS with Terraform

This project uses Terraform to deploy a Dockerized Python API (Flask + Gunicorn) on **AWS ECS (Fargate)**.

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- AWS CLI with credentials configured (`aws configure`)
- A built and pushed Docker image (ECR or Docker Hub)

---

## Setup

1. **Clone the repository**
   ```bash
   git clone git@github.com:nerdnest-bda/API-Backend-infra.git
   cd nerd-nest-infra
   ```

2. **Update your Docker image**
   Edit `terraform.tfvars` and set the full image URI:
   ```hcl
   container_image = "your-ECR-repo/nerd-nest-api:latest"
   db_connection = "your-mongo-connection-string"
   ```

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Apply the configuration**
   ```bash
   terraform apply
   ```

   Approve when prompted. It will:
   - Create an ECS cluster
   - Deploy your container
   - Assign a public IP
   - Open port 5000 to the internet

---

## Access Your API

Once the task is running:

1. Go to the **ECS Console → Your Cluster → Tasks**
2. Click the running task
3. Scroll to the **Network section**
4. Copy the **Public IP**
5. Access the API:

   ```bash
   http://<public-ip>:5000
   ```

---


## Teardown

To destroy all AWS resources:
```bash
terraform destroy
```

---

## Notes

- This uses the **default VPC**.
- Public IP is **ephemeral** — it will change on redeploys.
- For production, consider adding a **Load Balancer** and **custom domain**.

---
