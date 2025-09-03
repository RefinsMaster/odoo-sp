# 1. Comece a partir da imagem oficial 'odoo:18'.
FROM odoo:18

# 2. Mude para o usuário root para ter permissão.
USER root

# 3. Copie o seu arquivo de dependências.
COPY requirements.txt /etc/odoo/

# 4. AQUI ESTÁ A MUDANÇA:
#    Primeiro, removemos o pacote do sistema que causa o conflito.
#    Depois, instalamos as bibliotecas da sua lista com o pip.
RUN apt-get update && \
    apt-get remove -y python3-typing-extensions && \
    pip install -r /etc/odoo/requirements.txt --break-system-packages

# 5. Volte para o usuário padrão do Odoo.
USER odoo
