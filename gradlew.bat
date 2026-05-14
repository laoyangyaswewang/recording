@if "%DEBUG%" == "" @echo off
@rem Gradle wrapper for Windows
set DIR=%~dp0
java -Xmx1g -classpath "%DIR%gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
