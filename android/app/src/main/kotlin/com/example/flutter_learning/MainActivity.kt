package com.example.flutter_learning

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "appConfig"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getBaseUrl") {
                val baseUrl = getBaseUrl()

                if (baseUrl.isNotEmpty()) {
                    result.success(baseUrl)
                } else {
                    result.error("UNAVAILABLE", "BaseUrl  not available.", null)
                }
            } else if (call.method == "getDomain") {
                val baseUrl = getDomain()

                if (baseUrl.isNotEmpty()) {
                    result.success(baseUrl)
                } else {
                    result.error("UNAVAILABLE", "Domain level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBaseUrl(): String {
        return BuildConfig.BASE_URL
    }

    private fun getDomain(): String {
        return BuildConfig.DOMAIN
    }
}
