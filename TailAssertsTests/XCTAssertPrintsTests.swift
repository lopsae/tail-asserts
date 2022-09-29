//
//  TailAssertsTests
//


import XCTest


class XCTAssertPrintsTests: XCTestCase {

    /// Example outputs from XCTAssert function.
    ///
    /// Does not actually run any tests.
    func testExamplePrints() throws {
        throw XCTSkip()

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

