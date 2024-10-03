package com.nativebridging
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import android.util.Log
import com.facebook.react.bridge.Callback
import com.facebook.react.bridge.Promise

class NativeData (reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    override fun getName() = "NativeData"

    @ReactMethod
    fun dataPassToNative(name: String, callbackFn: Callback) {
        Log.d("NativeData", "Data pass from react native to native: $name")
        callbackFn("Callback function called")
    }

    @ReactMethod
    fun matchName (name: String, promise: Promise) {
        if(name == "Aditya"){
            promise.resolve("Matched")
        }
        else{
            promise.reject("Name not matched")
        }
    }
}