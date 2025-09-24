@echo off
echo 🐳 INICIANDO N8N DOCKER - PREVENTIVOS LA PAU
echo ============================================
echo.

cd /d "%~dp0"

echo 🔍 Verificando que la imagen esté construida...
docker images | findstr n8n-preventivos-lapau_n8n
if %errorlevel% neq 0 (
    echo ⚠️ La imagen no está construida. Ejecutando build...
    call build.bat
    if %errorlevel% neq 0 (
        echo ❌ Error en la construcción
        pause
        exit /b 1
    )
)

echo.
echo 🚀 Iniciando contenedores...
docker-compose up -d

if %errorlevel% neq 0 (
    echo ❌ Error iniciando los contenedores
    pause
    exit /b 1
)

echo.
echo ✅ N8N iniciado exitosamente
echo.
echo 🌐 Acceso Web: http://localhost:5678
echo 👤 Usuario: admin
echo 🔐 Contraseña: lapau2025
echo.
echo 📊 Para ver logs: docker-compose logs -f
echo ⏹️ Para detener: stop.bat
echo.

timeout /t 3 /nobreak >nul
start http://localhost:5678

pause
