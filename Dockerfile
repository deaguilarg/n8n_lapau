# 🐳 Dockerfile para N8N - Preventivos La Pau
# Incluye Tesseract.js y configuración personalizada

FROM n8nio/n8n:latest

# Información del mantenedor
LABEL maintainer="Grup La Pau - Sistema Preventivos"
LABEL description="N8N con Tesseract.js para automatización de correos preventivos"

# Cambiar a usuario root para instalar paquetes
USER root

# Instalar dependencias del sistema para Tesseract
RUN apk add --no-cache \
    tesseract-ocr \
    tesseract-ocr-data-spa \
    tesseract-ocr-data-eng \
    python3 \
    py3-pip \
    build-base \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    musl-dev \
    giflib-dev

# Crear directorio para nodos personalizados
RUN mkdir -p /usr/local/lib/node_modules

# Instalar nodos adicionales globalmente
RUN npm install -g \
    @n8n_io/n8n-nodes-tesseract \
    tesseract.js \
    sharp \
    canvas \
    pdf-parse \
    mammoth

# Configurar variables de entorno para N8N
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=lapau2025
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http

# Variables para optimización
ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=true
ENV N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true
ENV N8N_DISABLE_UI=false
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false
ENV N8N_TEMPLATES_ENABLED=false

# Variables de base de datos
ENV DB_TYPE=sqlite
ENV DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite

# Variables de seguridad
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_RUNNERS_ENABLED=true

# Crear directorios necesarios
RUN mkdir -p /home/node/.n8n/workflows
RUN mkdir -p /home/node/.n8n/credentials

# Cambiar permisos
RUN chown -R node:node /home/node/.n8n

# Volver al usuario node
USER node

# Exponer puerto
EXPOSE 5678

# Directorio de trabajo
WORKDIR /home/node

# Comando de inicio
CMD ["n8n", "start"]
