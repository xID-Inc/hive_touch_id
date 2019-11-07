import Cocoa
import FlutterMacOS
import LocalAuthentication

public class HiveTouchIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "hive_touch_id", binaryMessenger: registrar.messenger)
    let instance = HiveTouchIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    
    func authenticateUser(result: @escaping FlutterResult, promptText: String){
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = promptText

            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                
                success, authenticationError in

                DispatchQueue.main.async {
                    var statusDict: [String: Bool] = [:]
                    if success {
                        statusDict["success"] = true
                    } else {
                        statusDict["failed"] = true
                    }
                    result(statusDict)
                }
            }
        } else {
            DispatchQueue.main.async {
                let statusDict: [String: Bool] = ["notConfigured": true];
                result(statusDict)
            }
        }
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getTouchID":
        let promptText = call.arguments as! String
        authenticateUser(result:result,promptText:promptText)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
