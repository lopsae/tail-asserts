//
//  TailAssertsTests
//


@testable import TailAsserts
import XCTest


class TailAssertsTests: XCTestCase {

    func testFailureStruct() {



        // TODO: replace with string.assert(equals: )
        let noMessageFailure = Failure.make(
            function: "testFunction()", file: "TestFile.swift", line: 55)
        XCTAssertEqual(noMessageFailure.makeMessage(),
            "testFunction() failed")

        let emptyMessageFailure = Failure.make(
            message: "",
            function: "testFunction()",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(emptyMessageFailure.makeMessage(),
            "testFunction() failed")

        let almostEmptyMessageFailure = Failure.make(
            message: " ", // one space
            function: "testFunction()",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(almostEmptyMessageFailure.makeMessage(),
            "testFunction() failed:  ")

        let messageFailure = Failure.make(
            message: "main message",
            function: "testFunction()",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(messageFailure.makeMessage(),
            "testFunction() failed: main message")


        let allMessageFailure = Failure.make(
            message: "main message", otherMessages: ["message one", "message two"],
            function: "testFunction()", file: "TestFile.swift", line: 55)
        XCTAssertEqual(allMessageFailure.makeMessage(),
            "testFunction() failed: main message - message one - message two")

        let onlyOtherMessageFailure = Failure.make(
            otherMessages: ["message one", "message two"],
            function: "testFunction()",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(onlyOtherMessageFailure.makeMessage(),
            "testFunction() failed - message one - message two")

        let emptyArrayOtherMessageFailure = Failure.make(
            otherMessages: [],
            function: "testFunction()",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(emptyArrayOtherMessageFailure.makeMessage(),
            "testFunction() failed")

        let emptyOtherMessageFailure = Failure.make(
            otherMessages: ["", ""],
            function: "testFunction()",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(emptyOtherMessageFailure.makeMessage(),
            "testFunction() failed")

        let someEmptyOtherMessageFailure = Failure.make(
            otherMessages: ["", "message middle", ""],
            function: "testFunction()",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(someEmptyOtherMessageFailure.makeMessage(),
            "testFunction() failed - message middle")


        let functionFailure = Failure.make(
            function: "testFunction(param:test:)",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(functionFailure.makeMessage(),
            "testFunction(param:test:) failed")

        let cleanedFunctionFailure = Failure.make(
            function: "cleanedTestFunction(param:test:_:file:line:)",
            file: "TestFile.swift", line: 55)
        XCTAssertEqual(cleanedFunctionFailure.makeMessage(),
            "cleanedTestFunction(param:test:) failed")
    }

    func testExample() throws {

        true.assertTrue()
        false.assertFalse()

        false.assertTrue()
        false.assertTrue("caller message")

        Optional<String>.none.assertNil()

        let something: String? = "something"
        let nothing: String? = nil
        // TODO: when message is empty there is still a trailing `-`
        something.assertNil()
        something.assertNil("caller message")

        nothing.assertExists()
        nothing.assertExists("caller message")

        // Silent failure!
        nothing?.assertsStarts(with: "no")

        // Preferred unwrapping/check for optional
        nothing.assertExists()?
            .assertsStarts(with: "no")

        something.assertExists()?
            .assertsStarts(with: "some")

        something.assertExists()?
            .assertsStarts(with: "nope")

        something.assertExists()?
            .assertsStarts(with: "nope", "caller message")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
