# 🛒 AWS E-commerce Infrastructure with Terraform

Este projeto provisiona uma infraestrutura escalável na AWS para um e-commerce, utilizando **Terraform** para garantir consistência e automação (IaC).

## 🏗️ Arquitetura e Recursos

A infraestrutura está organizada de forma modular, separando a camada de rede da camada de persistência de dados.

### 🌐 Rede (Pasta `networking`)
* **VPC:** Rede isolada com bloco CIDR `10.0.0.0/16`.
* **State Management:** O estado do Terraform para o módulo de rede é armazenado remotamente no S3 (`devops-projeto-ecommerce-elias`) com travamento via DynamoDB para evitar conflitos.

### 📂 Backend e Dados (Pasta `backend`)
* **Amazon S3:** Bucket `devops-projeto-ecommerce-elias` configurado com **versionamento ativado** para segurança e recuperação de dados.
* **Amazon DynamoDB:** Tabela `nsse-terraform-state-locking` utilizada para controle de concorrência e state locking do Terraform.
* **Segurança:** Uso de perfis de IAM (`terraform-role`) para execução segura das alterações.

## 🛠️ Detalhes Técnicos

O projeto utiliza boas práticas de Terraform, incluindo:
* **Remote Backend:** Armazenamento seguro do arquivo `terraform.tfstate` na nuvem.
* **Variáveis Dinâmicas:** Uso de `variables.tf` para gerenciar regiões (default: `us-east-1`) e tags de projeto.
* **Tags Globais:** Todos os recursos são identificados com as tags `Project: not-so-simple-ecommerce` e `Environment: production`.

## 🚀 Troubleshooting de DevOps

Durante a execução, resolvi um desafio crítico de versionamento:
1. **Remoção de Binários:** O histórico do Git foi limpo para remover arquivos do provedor AWS que somavam mais de **800MB**.
2. **Correção de Gitignore:** Implementação de `.gitignore` na raiz do projeto para ignorar pastas `.terraform/`, garantindo um repositório leve (aprox. 2KB de código).

---
**Desenvolvido por Elias Anjos**


<img width="1891" height="625" alt="Captura de tela 2026-03-28 235916" src="https://github.com/user-attachments/assets/10411a7e-0d08-4a06-86bf-de43e40b67f8" />

*Cloud Architecture & DevOps Portfólio*

