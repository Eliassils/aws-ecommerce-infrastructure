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
<img width="1919" height="1009" alt="Captura de tela 2026-03-29 000033" src="https://github.com/user-attachments/assets/9de7fa3d-9a79-4cf7-b101-90410cef0ad1" />
<img width="1519" height="671" alt="Captura de tela 2026-03-29 000052" src="https://github.com/user-attachments/assets/26f61222-4b96-4ab4-b868-ed3a05880ed9" />
<img width="1853" height="532" alt="Captura de tela 2026-03-29 000101" src="https://github.com/user-attachments/assets/b4113eef-b646-4a80-b876-97e338920917" />
<img width="1919" height="865" alt="Captura de tela 2026-03-29 000119" src="https://github.com/user-attachments/assets/fb3ab51c-af77-446b-9fdf-462d55802ff3" />
<img width="1611" height="623" alt="Captura de tela 2026-03-29 000128" src="https://github.com/user-attachments/assets/16cee30e-a6f0-44cd-b309-6db76424cbbc" />
<img width="1869" height="408" alt="Captura de tela 2026-03-29 000541" src="https://github.com/user-attachments/assets/3e6dcb70-d285-4160-9d7f-e86df4bd57b1" />
<img width="1865" height="469" alt="Captura de tela 2026-03-29 000614" src="https://github.com/user-attachments/assets/734a3125-d8f3-4155-b3df-4ccdff44d9a5" />
<img width="1851" height="513" alt="Captura de tela 2026-03-29 000634" src="https://github.com/user-attachments/assets/ab26b028-df96-45bf-ac61-9915e5d884ba" />
<img width="1851" height="429" alt="Captura de tela 2026-03-29 000713" src="https://github.com/user-attachments/assets/1479de40-6c6b-4383-95a2-f6282f76f9ce" />
<img width="1859" height="795" alt="Captura de tela 2026-03-29 000743" src="https://github.com/user-attachments/assets/a13d1cd1-ccc6-447d-b3c6-7f6e97cd9059" />
<img width="772" height="456" alt="Captura de tela 2026-03-29 002413" src="https://github.com/user-attachments/assets/dc4d94a9-ece2-4dba-a578-1ee66bd532ef" />


*Cloud Architecture & DevOps Portfólio*

