import UIKit
import Flutter

var deploymentMode : DevelopmentMode {
    #if DEV
        return .dev
    #elseif QA
        return .qa
    #elseif UAT
        return .uat
    #else
        return .live
    #endif
};


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var configuration:Config?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
           let batteryChannel = FlutterMethodChannel(name: "appConfig",
                                                     binaryMessenger: controller.binaryMessenger)
           batteryChannel.setMethodCallHandler({
             (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
               self.getConfiguration()
               guard call.method == "getBaseUrl" else {
                  result(FlutterMethodNotImplemented)
                  return
                }
               self.getBaseUrl(result: result)
           })

        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func getBaseUrl(result: FlutterResult) {
        result(configuration?.baseUrl)
    }

    public func getConfiguration(){
        switch deploymentMode {
        case .dev:
            configuration = Config(baseUrl:"http://dev-graphql.kuostats.com", apiKey: "16c9c17b5f17cba2edd2981deb74a46d123a9848d443c9d59ea4231f54892ada3391542f48609387", clientSecret: "cxq0qez0BuFR7pSFFn7O", clientId: "f22e2250-3137-40f9-a8f3-1c704c451c14")
        case .qa:
            configuration = Config(baseUrl:"http://qa-graphql.kuostats.com", apiKey: "16c9c17b5f17cba2edd2981deb74a46d123a9848d443c9d59ea4231f54892ada3391542f48609387", clientSecret: "cxq0qez0BuFR7pSFFn7O", clientId: "f22e2250-3137-40f9-a8f3-1c704c451c14")
        case .live:
            configuration = Config(baseUrl:"http://graphql.kuostats.com", apiKey: "16c9c17b5f17cba2edd2981deb74a46d123a9848d443c9d59ea4231f54892ada3391542f48609387", clientSecret: "cxq0qez0BuFR7pSFFn7O", clientId: "f22e2250-3137-40f9-a8f3-1c704c451c14")
        case .uat:
            configuration = Config(baseUrl:"http://uat-graphql.kuostats.com", apiKey: "16c9c17b5f17cba2edd2981deb74a46d123a9848d443c9d59ea4231f54892ada3391542f48609387", clientSecret: "cxq0qez0BuFR7pSFFn7O", clientId: "f22e2250-3137-40f9-a8f3-1c704c451c14")
        }
    }
}
