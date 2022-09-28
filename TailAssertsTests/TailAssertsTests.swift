//
//  TailAssertsTests
//


@testable import TailAsserts
import XCTest


class TailAssertsTests: XCTestCase {

    func testFailureStruct() {
        let noMessageFailure = Failure.make(
            function: "testFunction()", file: "TestFile.swift", line: 55)
        print(noMessageFailure.makeMessage())

        let messageFailure = Failure.make(
            message: "main message", function: "testFunction()", file: "TestFile.swift", line: 55)
        print(messageFailure.makeMessage())

        let onlyOtherMessageFailure = Failure.make(
            otherMessages: ["message one", "message two"], function: "testFunction()", file: "TestFile.swift", line: 55)
        print(onlyOtherMessageFailure.makeMessage())

        let allMessageFailure = Failure.make(
            message: "main message", otherMessages: ["message one", "message two"],
            function: "testFunction()", file: "TestFile.swift", line: 55)
        print(allMessageFailure.makeMessage())

        let functionFailure = Failure.make(
            function: "testFunction(param:test:)", file: "TestFile.swift", line: 55)
        print(functionFailure.makeMessage())

        let cleanedFunctionFailure = Failure.make(
            function: "cleanedTestFunction(param:test:_:file:line:)", file: "TestFile.swift", line: 55)
        print(cleanedFunctionFailure.makeMessage())
    }

    func testExample() throws {
        XCTAssert(true, "XCTAssert message")
        true.assertTrue()
        false.assertTrue("some message")
        // "XCTAssertTrue failed - XCTAssert message"

        XCTAssertNil(nil, "XCTAssertNil message")
        XCTAssertNil("one", "XCTAssertNil message")
        // "XCTAssertNil failed: "one" - XCTAssertNil message"

        XCTAssertTrue(true, "XCTAssertTrue message")
        // "XCTAssertTrue failed - XCTAssertTrue message"

        XCTAssertEqual("one", "one", "XCTAssertEqual message")
        // "XCTAssertEqual failed: ("one") is not equal to ("two") - XCTAssertEqual message"

        // XCTFail("XCTFail message")
        // "failed - XCTFail message"
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
