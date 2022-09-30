//
//  TailAssertsTests
//


import UIKit


class TestingAppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        print("🧪 Open Session: \(application.openSessions)")
        print("🧪 Testing Application did finish launching")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = connectingSceneSession.configuration
        configuration.delegateClass = TestingSceneDelegate.self

        let nameString = configuration.name ?? "no-name"
        let delegateString = configuration.delegateClass.map(String.init(describing:)) ?? "no-delegate"
        print("🧪 Scene configuration modified: name:\(nameString) delegate:\(delegateString)")
        
        return configuration
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        let scenesInfo = sceneSessions.map {
            session -> String in
            let configuration = session.configuration
            let nameString = configuration.name ?? "no-name"
            let delegateString = configuration.delegateClass.map(String.init(describing:))
                ?? "no-delegate"
            return "id:\(session.persistentIdentifier) name:\(nameString) delegate:\(delegateString)"
        }
        print("🗑 Discarded scene sessions: \(scenesInfo)")
    }
}

