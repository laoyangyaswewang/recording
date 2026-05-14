#!/bin/sh
# Gradle wrapper script
if [ -f /system/bin/dalvikvm ]; then
    # Android
    java -Xmx1g -classpath "$DIR/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
else
    # Linux/macOS
    DIR=$(dirname "$0")
    java -Xmx1g -classpath "$DIR/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
fi
