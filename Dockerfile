# 1. Comece A PARTIR da imagem oficial 'odoo:18'. 
#    Ela já contém todo o código do arquivo gigante que você encontrou.
FROM odoo:18

# 2. Mude para o usuário root para ter permissão de instalar pacotes
USER root

# 3. Copie o seu arquivo de dependências para dentro da imagem
COPY requirements.txt /etc/odoo/

# 4. Instale as bibliotecas da sua lista usando pip, com o parâmetro 
#    que descobrimos ser necessário para este sistema.
RUN pip install -r /etc/odoo/requirements.txt --break-system-packages

# 5. Volte para o usuário padrão do Odoo por segurança
USER odoo
