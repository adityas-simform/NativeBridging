package com.nativebridging

import android.os.CountDownTimer
import android.util.Log
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.Callback
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.WritableMap
import com.facebook.react.modules.core.DeviceEventManagerModule
import java.util.HashMap

class Stream  (reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    private val context = reactContext
    private var count = 0
    val params: WritableMap = Arguments.createMap()

    private val intervalMillis = 1000L // 2 seconds
    private var countDownTimer: CountDownTimer? = null

    override fun getName() = "StreamingInterval"

    @ReactMethod
    fun startStreaming() {
        if (countDownTimer == null) {
            countDownTimer = object : CountDownTimer(Long.MAX_VALUE, intervalMillis) {
                override fun onTick(millisUntilFinished: Long) {
                    count++
                    val params = Arguments.createMap() // Create a new WritableMap for each event
                    params.putInt("data", count)
                    sendEvent(context, "onTimerChange", params)
                }

                override fun onFinish() {
                    // Code to be executed when the timer finishes (optional)
                }
            }
            countDownTimer?.start()
        } else {
            // Handle the case where timer is already started (optional)
            // You could log a warning or throw an exception here
        }
    }

    @ReactMethod
    fun stopStreaming() {
        countDownTimer?.cancel()
    }

    private fun sendEvent(reactContext: ReactContext, eventName: String, params: ReadableMap) {
        reactContext
            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
            .emit(eventName, params)
    }
}