#!/usr/bin/env sh

./gradlew
java --add-exports java.desktop/com.sun.media.sound=ALL-UNNAMED  -jar build/libs/radicalaces.jar