#!/bin/bash
# Abre a página de downloads no navegador
cd /home/lima/Projetos/GOF2-Mod
echo "Servidor local iniciado em http://localhost:8080"
echo "Pressione Ctrl+C para parar"
python3 -m http.server 8080
