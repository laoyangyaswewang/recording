@echo off
chcp 65001 >nul
echo ========================================
echo   ScreenRecorderApp 一键编译脚本
echo ========================================
echo.

:: 检查 Java
java -version 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未找到 Java！请先安装 JDK 17
    echo 下载: https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.msi
    pause
    exit /b 1
)
echo [✓] Java 检查通过

:: 检查 Gradle 本地缓存
set GRADLE_DIR=%USERPROFILE%\.gradle\wrapper\dists
if not exist "%GRADLE_DIR%" mkdir "%GRADLE_DIR%"
echo [*] 开始编译（首次会下载依赖，约需 2~5 分钟）...
echo.

call gradlew.bat assembleDebug --no-daemon

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   ✅ 编译成功！
    echo   输出文件：app\build\outputs\apk\debug\app-debug.apk
    echo ========================================
) else (
    echo.
    echo ========================================
    echo   ❌ 编译失败，请截图错误信息发给 AI
    echo ========================================
)

pause
