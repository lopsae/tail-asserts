//
//  TailAsserts
//


import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        print("✅ Open Session: \(application.openSessions)")
        print("✅ Application did finish launching")
        return true
    }


    // Deleting the scene configuration in `info.plist` seems to force the
    // `UISceneSession` to be recreated in every launch. Some launches also
    // seem to dispose of the older session.
    //
    // With scene configuration settings in `info.plist`, the scene session
    // is still being recreated in every launch. When running tests, the
    // `TestSceneDelegate` will be created, saved, and reported as missing on
    // the next app run.
    //
    // Above has been found to happen when tests are run with a breakpoing, then
    // allowed to complete, then running the app.
    //
    // https://gist.github.com/HiddenJester/e5409ce2ca823b0003c59ce11a494b1d
    // https://hacknicity.medium.com/how-to-switch-your-ios-app-and-scene-delegates-for-improved-testing-9746279378c3
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = connectingSceneSession.configuration
        print("✅ Scene configuration forwarded: \(configuration.logger.details)")
        return configuration
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        let scenesInfo = sceneSessions.map {
            session -> String in
            return "id:\(session.persistentIdentifier) \(session.configuration.logger.details)"
        }
        print("🗑 Discarded scene sessions: \(scenesInfo)")
    }

}

