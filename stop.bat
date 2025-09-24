@echo off
echo 🐳 DETENIENDO N8N DOCKER - PREVENTIVOS LA PAU
echo =============================================
echo.

cd /d "%~dp0"

echo ⏹️ Deteniendo contenedores...
docker-compose down

if %errorlevel% neq 0 (
    echo ⚠️ Algunos contenedores pueden no haberse detenido correctamente
) else (
    echo ✅ Contenedores detenidos exitosamente
)

echo.
echo 📊 Estado de contenedores:
docker-compose ps

echo.
echo 🔄 Para reiniciar: start.bat
echo 🗑️ Para limpiar todo: cleanup.bat
echo.

pause
