package com.rwad.rwadtwo.rwad_two

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
    private val CHANNEL = "rwad2"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getNativeData") {
                val data = getNativeData()
                result.success(data)
            } else {
                result.notImplemented()
            }
        }
    }
    private fun getNativeData(): String {
        return "Hello from Android Native Code"
    }
}
