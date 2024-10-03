package com.nativebridging;
import android.widget.Toast;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import java.util.Map;
import java.util.HashMap;

public class NativeToast extends ReactContextBaseJavaModule {
    NativeToast(ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "NativeToast";
    }

    @ReactMethod
    public void showNativeToast(String name) {
        System.out.println(name);
        Toast.makeText(getCurrentActivity(), "Native toast ", Toast.LENGTH_SHORT).show();
    }
}
