import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "getNativeData" {
                let data = self.getNativeData()
                result(data)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
         private func getNativeData() -> String {
             return "Hello from iOS Native Code"
         }


