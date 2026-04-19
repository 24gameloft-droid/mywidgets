package com.mydev.mywidgets
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Intent

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.mydev.mywidgets/channel"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "pinPhotoWidget") {
                val mgr = AppWidgetManager.getInstance(this)
                if (mgr.isRequestPinAppWidgetSupported) {
                    mgr.requestPinAppWidget(ComponentName(this, PhotoWidgetProvider::class.java), null, null)
                }
                result.success(true)
            } else { result.notImplemented() }
        }
    }
}
