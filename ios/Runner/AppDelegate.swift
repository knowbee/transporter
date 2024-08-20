import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let channel = "com.knowbee.transporter/environment"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: channel, binaryMessenger: controller.binaryMessenger)

        methodChannel.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "setApiKey", let apiKey = call.arguments as? String {
                GMSServices.provideAPIKey(apiKey)
            }
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
