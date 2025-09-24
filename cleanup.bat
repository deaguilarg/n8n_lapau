@echo off
echo 🐳 LIMPIEZA COMPLETA N8N DOCKER - PREVENTIVOS LA PAU
echo ===================================================
echo.

cd /d "%~dp0"

echo ⚠️ ADVERTENCIA: Esta acción eliminará TODOS los datos de N8N
echo    - Workflows guardados
echo    - Credenciales configuradas
echo    - Historial de ejecuciones
echo    - Base de datos SQLite
echo.

set /p confirm="¿Estás seguro? (s/N): "
if /i not "%confirm%"=="s" (
    echo ❌ Operación cancelada
    pause
    exit /b 0
)

echo.
echo 🛑 Deteniendo contenedores...
docker-compose down

echo.
echo 🗑️ Eliminando volúmenes...
docker volume rm n8n_preventivos_data 2>nul

echo.
echo 🗑️ Eliminando imágenes...
docker rmi n8n-preventivos-lapau_n8n 2>nul

echo.
echo 🧹 Limpiando sistema Docker...
docker system prune -f

echo.
echo ✅ Limpieza completada
echo.
echo 🔄 Para volver a empezar: build.bat
echo.

pause
