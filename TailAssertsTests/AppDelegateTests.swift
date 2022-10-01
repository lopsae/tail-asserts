//
//  TailAssertsTests
//


import XCTest


class AppDelegateTests: XCTestCase {

    func testAppDelegate() {
        assertType(UIApplication.shared.delegate, is: TestingAppDelegate.self)
    }

}
