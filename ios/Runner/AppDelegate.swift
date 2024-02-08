import UIKit

import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private var channelName = "solutions.flutterflow.io/toast"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
          let channel = FlutterMethodChannel(name: channelName,
                                             binaryMessenger: controller.binaryMessenger)
          
          channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // Check if the method call is showToast
            if call.method == "showToast" {
              guard let args = call.arguments as? String,
                    let message = args as? String else {
                      result(FlutterError(code: "INVALID_ARGUMENTS", message: "Error retrieving string", details: nil))
                      return
                    }
              self.showToast(message: message, controller: controller)
              result("Toast displayed in iOS")
            } else {
              result(FlutterMethodNotImplemented)
            }
          })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func showToast(message: String, controller: FlutterViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { // Change 2 to your desired display time
            alert.dismiss(animated: true)
        }
    }

}
