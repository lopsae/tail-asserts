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

        true.assertTrue()
        false.assertFalse()

        false.assertTrue("caller message")

        Optional<String>.none.assertNil()

        let something: String? = "something"
        let nothing: String? = nil
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
