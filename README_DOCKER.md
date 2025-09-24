# 🐳 N8N Docker - Preventivos La Pau

## 📋 Descripción
Contenedor Docker personalizado de N8N con Tesseract.js y configuración específica para automatización de correos preventivos.

## 🏗️ Características del Contenedor

### 📦 Nodos Incluidos
- ✅ **N8N Base**: Última versión estable
- ✅ **Tesseract.js**: Para OCR de imágenes y PDFs
- ✅ **Sharp**: Procesamiento de imágenes
- ✅ **Canvas**: Generación de gráficos
- ✅ **PDF-Parse**: Extracción de texto de PDFs
- ✅ **Mammoth**: Conversión de documentos Word

### 🌍 Idiomas OCR Soportados
- 🇪🇸 **Español** (spa)
- 🇬🇧 **Inglés** (eng)

### ⚙️ Configuración Preestablecida
- **Puerto**: 5678
- **Autenticación**: admin/lapau2025
- **Base de Datos**: SQLite persistente
- **Timezone**: Europe/Madrid
- **Optimizaciones**: Errores 403/429 deshabilitados

## 🚀 Uso Rápido

### 1. Construir Imagen
```bash
# Ejecutar desde Windows
build.bat

# O manualmente
docker-compose build
```

### 2. Iniciar Contenedor
```bash
# Ejecutar desde Windows
start.bat

# O manualmente
docker-compose up -d
```

### 3. Acceder a N8N
- **URL**: http://localhost:5678
- **Usuario**: `admin`
- **Contraseña**: `lapau2025`

### 4. Detener Contenedor
```bash
# Ejecutar desde Windows
stop.bat

# O manualmente
docker-compose down
```

## 📁 Estructura de Directorios

```
n8n_docker/
├── 🐳 DOCKER
│   ├── Dockerfile              # Imagen personalizada
│   ├── docker-compose.yml     # Configuración servicios
│   ├── build.bat              # Construir imagen
│   ├── start.bat              # Iniciar contenedor
│   ├── stop.bat               # Detener contenedor
│   └── cleanup.bat            # Limpieza completa
│
├── 📋 WORKFLOWS
│   └── preventivos_workflow.json # Workflow principal
│
├── 🔐 CREDENTIALS
│   └── credentials_example.json  # Ejemplo credenciales
│
├── 📊 LOGS
│   └── (logs automáticos)
│
└── 📄 TEMP
    └── (archivos temporales)
```

## 🔧 Configuración de Credenciales

### 1. IMAP (Correo)
```json
{
  "name": "Correo Preventivos",
  "host": "correu.gruplapau.com",
  "port": 143,
  "secure": false,
  "user": "serveispreventius@gruplapau.net",
  "password": "[CONFIGURAR]"
}
```

### 2. Gemini AI
```json
{
  "name": "Gemini API",
  "header": "x-goog-api-key",
  "value": "AIzaSyAR2FxYoJUyoPWgDvibtGEJmRYSyfAOVgQ"
}
```

### 3. SQL Server
```json
{
  "name": "SQL Server La Pau",
  "server": "192.168.0.124\\MSSQL2017",
  "database": "stage",
  "user": "daguilar",
  "password": "Lapau2025@@"
}
```

### 4. SMTP (Notificaciones)
```json
{
  "name": "SMTP La Pau",
  "host": "correu.gruplapau.com",
  "port": 587,
  "secure": "starttls",
  "user": "serveispreventius@gruplapau.net",
  "password": "[CONFIGURAR]"
}
```

## 📊 Monitoreo y Logs

### Ver Logs en Tiempo Real
```bash
docker-compose logs -f
```

### Ver Estado de Contenedores
```bash
docker-compose ps
```

### Acceder al Contenedor
```bash
docker-compose exec n8n bash
```

## 🔄 Persistencia de Datos

### Datos Persistentes
- ✅ **Workflows**: `/workflows` (montado)
- ✅ **Credenciales**: `/credentials` (montado)
- ✅ **Base de Datos**: Volumen `n8n_preventivos_data`
- ✅ **Logs**: `/logs` (montado)

### Backup Manual
```bash
# Backup de workflows
docker cp n8n-preventivos-lapau:/home/node/.n8n/workflows ./backup_workflows

# Backup de base de datos
docker cp n8n-preventivos-lapau:/home/node/.n8n/database.sqlite ./backup_database.sqlite
```

## 🚀 Despliegue en Servidor

### 1. Copiar Directorio Completo
```bash
# Copiar toda la carpeta n8n_docker al servidor
scp -r n8n_docker/ usuario@servidor:/path/to/preventivos/
```

### 2. Configurar en Servidor
```bash
# En el servidor
cd /path/to/preventivos/n8n_docker

# Construir imagen
docker-compose build

# Iniciar contenedor
docker-compose up -d
```

### 3. Configurar Proxy Reverso (Opcional)
```nginx
# Nginx
location /n8n/ {
    proxy_pass http://localhost:5678/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}
```

## 🆘 Solución de Problemas

### ❌ Error: "Docker no encontrado"
```bash
# Instalar Docker Desktop
# https://www.docker.com/products/docker-desktop
```

### ❌ Error: "Puerto 5678 ocupado"
```bash
# Cambiar puerto en docker-compose.yml
ports:
  - "5679:5678"  # Usar puerto 5679
```

### ❌ Error: "No puede conectar a SQL Server"
```bash
# Verificar conectividad desde contenedor
docker-compose exec n8n ping 192.168.0.124
```

### ❌ Error: "Volumen no encontrado"
```bash
# Recrear volúmenes
docker volume create n8n_preventivos_data
```

## 🎯 Ventajas del Docker

### ✅ **Portabilidad**
- Mismo entorno en desarrollo y producción
- Fácil migración entre servidores

### ✅ **Aislamiento**
- No afecta el sistema host
- Dependencias encapsuladas

### ✅ **Escalabilidad**
- Fácil replicación
- Gestión con orquestadores (Docker Swarm, Kubernetes)

### ✅ **Mantenimiento**
- Actualizaciones controladas
- Rollback rápido

### ✅ **Seguridad**
- Contenedor aislado
- Configuración inmutable

---

## 🎉 ¡Listo para Producción!

El contenedor está optimizado para:
- ✅ **Captura automática** de correos cada 5 minutos
- ✅ **Análisis IA** con Gemini
- ✅ **OCR** con Tesseract.js
- ✅ **Persistencia** de datos
- ✅ **Monitoreo** completo
- ✅ **Despliegue** fácil

**¡Tu sistema de automatización está dockerizado y listo para el servidor!**
