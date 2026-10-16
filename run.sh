#!/usr/bin/env bash
set -e

restore() {
adb -s "$DEVICE" shell wm size reset
adb -s "$DEVICE" shell wm density reset
}

trap restore EXIT
adb shell wm size 1920x1080
adb shell wm density 220
scrcpy -K
#to get rid of ugly oversized bar on miui 12.5.5 use "adb  shell cmd overlay enable com.android.internal.display.cutout.emulation.tall" and "adb  shell cmd overlay enable com.android.systemui.notch.overlay" also to rotate home screen you need an external app with permission to draw windows over other apps, i use "adb  shell am start -n org.crape.rotationcontrol/org.crape.rotationcontrol.RotationControlActivity"
