package com.shaan.speedo_flutter

import android.net.TrafficStats
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

/** SpeedoFlutterPlugin */
class SpeedoFlutterPlugin : FlutterPlugin, EventChannel.StreamHandler {
    private lateinit var eventChannel: EventChannel
    
    private var handler: Handler? = null
    private var runnable: Runnable? = null
    private var lastBytes: Long = 0

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "speedStream")
        eventChannel.setStreamHandler(this)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        handler = Handler(Looper.getMainLooper())
        lastBytes = TrafficStats.getTotalRxBytes() + TrafficStats.getTotalTxBytes()

        runnable = object : Runnable {
            override fun run() {
                val currentBytes = TrafficStats.getTotalRxBytes() + TrafficStats.getTotalTxBytes()
                val byteDiff = currentBytes - lastBytes
                
                // Converting byte difference to Mbps
                // (byteDiff * 8 bits) / 1,000,000 = Mbps
                val speedMbps = (byteDiff * 8).toDouble() / 1_000_000.0
                
                lastBytes = currentBytes
                events?.success(speedMbps)
                
                handler?.postDelayed(this, 1000)
            }
        }
        handler?.post(runnable!!)
    }

    override fun onCancel(arguments: Any?) {
        handler?.removeCallbacks(runnable!!)
        handler = null
        runnable = null
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel.setStreamHandler(null)
    }
}
