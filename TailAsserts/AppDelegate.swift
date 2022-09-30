//
//  TailAsserts
//


import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        print("✴️ Open Session: \(application.openSessions)")
        print("✅ Application did finish launching")
        return true
    }

    // MARK: UISceneSession Lifecycle

    // Deleting the scene configuration in `info.plist` seems to force the
    // `UISceneSession` to be recreated in every launch. Some launches also
    // seem to dispose of the older session.
    // https://gist.github.com/HiddenJester/e5409ce2ca823b0003c59ce11a494b1d
    // https://hacknicity.medium.com/how-to-switch-your-ios-app-and-scene-delegates-for-improved-testing-9746279378c3
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = connectingSceneSession.configuration
        configuration.delegateClass = SceneDelegate.self
        print("✅ Scene configuration created")
        return configuration
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        let scenesInfo = sceneSessions.map {
            session -> String in
            let delegateString = session.configuration.delegateClass != nil
                ? String(describing: session.configuration.delegateClass!)
                : "no-delegate"
            return "id:\(session.persistentIdentifier) delegate:\(delegateString)"
        }
        print("🗑 Discarded scene sessions: \(scenesInfo)")
    }


}

