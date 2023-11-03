#!/bin/bash

# Solicita o nome da branch
read -p "Digite o nome da branch: " branch_name

# Verifica se a branch atual é a mesma da especificada
if [ "$branch_name" != "$(git rev-parse --abbrev-ref HEAD)" ]; then
  # Se não for a mesma branch, cria a nova branch e muda para ela
  git checkout -b "$branch_name"
fi

# Solicita uma mensagem de commit
read -p "Digite a mensagem do commit: " commit_message

# Adiciona todas as mudanças
git add .

# Realiza o commit com a mensagem fornecida
git commit -m "$commit_message"

# Realiza o push para a branch no repositório remoto com o mesmo nome
git push -u origin "$branch_name"
