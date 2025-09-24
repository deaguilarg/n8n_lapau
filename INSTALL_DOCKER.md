# 🐳 Instalación de Docker - Preventivos La Pau

## 📋 Pasos para Instalar Docker

### 1. Descargar Docker Desktop
- Ve a: https://www.docker.com/products/docker-desktop
- Descarga **Docker Desktop for Windows**
- Ejecuta el instalador

### 2. Configuración Inicial
- ✅ Habilitar **WSL 2** (Windows Subsystem for Linux)
- ✅ Habilitar **Hyper-V** (si está disponible)
- ✅ Reiniciar el sistema después de la instalación

### 3. Verificar Instalación
```bash
# Verificar Docker
docker --version

# Verificar Docker Compose
docker-compose --version

# Probar funcionamiento
docker run hello-world
```

## 🚀 Una vez Instalado Docker

### 1. Construir N8N
```bash
cd n8n_docker
build.bat
```

### 2. Iniciar N8N
```bash
start.bat
```

### 3. Acceder
- URL: http://localhost:5678
- Usuario: admin
- Contraseña: lapau2025

## 🔧 Configuración de WSL 2 (si es necesario)

### 1. Habilitar WSL
```powershell
# Ejecutar como Administrador
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### 2. Descargar WSL 2 Kernel
- Ve a: https://aka.ms/wsl2kernel
- Descarga e instala el kernel

### 3. Configurar WSL 2 como Predeterminado
```bash
wsl --set-default-version 2
```

## ⚠️ Problemas Comunes

### Error: "Docker Desktop no inicia"
- Verificar que Hyper-V esté habilitado
- Verificar que WSL 2 esté configurado
- Reiniciar el sistema

### Error: "WSL 2 no funciona"
- Verificar versión de Windows (requiere Windows 10 versión 2004+)
- Instalar actualizaciones de Windows
- Habilitar virtualización en BIOS

### Error: "Puerto 5678 ocupado"
- Cambiar puerto en docker-compose.yml
- O detener otros servicios que usen el puerto

---

## 🎯 Resultado Final

Una vez instalado Docker, tendrás:
- ✅ **N8N Dockerizado** con Tesseract.js
- ✅ **Automatización completa** de correos
- ✅ **Fácil despliegue** en cualquier servidor
- ✅ **Persistencia de datos** garantizada
- ✅ **Monitoreo** y logs completos

**¡Tu sistema estará listo para producción!**
