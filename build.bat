@echo off
echo 🐳 CONSTRUYENDO CONTENEDOR N8N - PREVENTIVOS LA PAU
echo ===================================================
echo.

cd /d "%~dp0"

echo 🔧 Verificando Docker...
docker --version
if %errorlevel% neq 0 (
    echo ❌ Error: Docker no está instalado o no está en el PATH
    echo    Instala Docker Desktop desde: https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

echo.
echo 🏗️ Construyendo imagen personalizada de N8N...
docker-compose build --no-cache

if %errorlevel% neq 0 (
    echo ❌ Error construyendo la imagen
    pause
    exit /b 1
)

echo.
echo ✅ Imagen construida exitosamente
echo.
echo 🚀 Para iniciar N8N, ejecuta: start.bat
echo 🌐 URL: http://localhost:5678
echo 👤 Usuario: admin | Contraseña: lapau2025
echo.

pause
