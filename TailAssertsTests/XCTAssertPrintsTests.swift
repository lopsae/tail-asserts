//
//  TailAssertsTests
//


import XCTest


class XCTAssertPrintsTests: XCTestCase {

    /// Example outputs from XCTAssert function. Used to inspect the default
    /// messaging used by XCAssert functions.
    ///
    /// All failures in this function are ignored.
    func testExamplePrints() throws {
        let options = XCTExpectedFailure.Options()
        options.issueMatcher = { issue in
            // Disables all issues result of XCTAssert functions
            return issue.type == .assertionFailure
        }
        XCTExpectFailure(options: options)

        XCTFail("test message")
        // prints: failed - test message

        XCTAssert(false, "test message")
        // prints: XCTAssertTrue failed - test message

        XCTAssertNil("one", "test message")
        // prints: XCTAssertNil failed: "one" - test message

        XCTAssertTrue(false, "test message")
        // prints: XCTAssertTrue failed - test message

        XCTAssertEqual("one", "two", "test message")
        // prints: XCTAssertEqual failed: ("one") is not equal to ("two") - test message
    }

}

