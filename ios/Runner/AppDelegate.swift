import UIKit
import Flutter
import YandexMapsMobile
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {


    YMKMapKit.setApiKey("d2bfb218-1fe3-4328-bba1-b4a182f6d520")

    GMSServices.provideAPIKey("AIzaSyCbExavr8ihhOGRDQgWgwHe8QKweRSQBkI")


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
