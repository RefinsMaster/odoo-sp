# 1. Comece com a imagem oficial do Odoo 18.
FROM odoo:18

# 2. Mude para o usuário root.
USER root

# 3. Copie o seu arquivo de dependências.
COPY requirements.txt /etc/odoo/

# 4. AQUI ESTÁ A MUDANÇA FINAL:
#    Instalamos com o pip, mas dizemos a ele para ignorar os pacotes
#    já instalados pelo sistema, em vez de tentar desinstalá-los.
RUN pip install --ignore-installed -r /etc/odoo/requirements.txt --break-system-packages

# 5. Volte para o usuário padrão do Odoo.
USER odoo
