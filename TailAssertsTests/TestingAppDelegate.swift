//
//  TailAssertsTests
//


@testable import TailAsserts
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
        print("🧪 Scene configuration modified: \(LogUtils.details(for: configuration))")

        return configuration
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        let scenesInfo = sceneSessions.map {
            session -> String in
            return "id:\(session.persistentIdentifier) \(LogUtils.details(for: session.configuration))"
        }
        print("🗑 Discarded scene sessions: \(scenesInfo)")
    }
}

