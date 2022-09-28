//
//  TailAssertsTests
//


import XCTest


struct Failure {

    let function: StaticString
    let file: StaticString
    let line: UInt

    let message: String
    let otherMessages: [String]


    static func make(
        message: @autoclosure Message = .init(),
        otherMessages: @autoclosure Messages = [],
        function: StaticString,
        file: StaticString, line: UInt)
    -> Failure {
        return Failure(
            function: function, file: file, line: line,
            message: message(), otherMessages: otherMessages())
    }


    static func trigger(
        message: @autoclosure Message = .init(),
        otherMessages: @autoclosure Messages = [],
        function: StaticString,
        file: StaticString, line: UInt)
    {
        let failure = Self.make(
            message: message(), otherMessages: otherMessages(),
            function: function, file: file, line: line)
        failure.fail()
    }


    func makeMessage() -> String {
        let cleanFunction = function.description.replacingOccurrences(of: "_:file:line:", with: "")
        let messageHead = message.isEmpty
            ? "\(cleanFunction) failed"
            : "\(cleanFunction) failed: \(message)"

        var messageParts = [messageHead]
        messageParts.append(contentsOf: otherMessages)

        let completeMessage = messageParts.joined(separator: " - ")
        return completeMessage
    }


    func fail() {
        let completeMessage = makeMessage()

        // TODO: can this be abstracted to a protocol for testing?
        XCTFail(completeMessage, file: file, line: line)
    }

}

