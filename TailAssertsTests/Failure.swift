//
//  TailAssertsTests
//


import XCTest


/// Defines a format for assertion failures.
///
/// In general the format is made of these parts:
/// ```
/// {functionSignature} failed
/// // only with assertionMessage
/// {functionSignature} failed: {assertionMessage}
/// // only with additionalMessages
/// {functionSignature} failed - {addlMessage} - {moreAddlMessage}
/// // with all messages
/// {functionSignature} failed: {assertionMessage} - {addlMessage} - {moreAddlMessage}
/// ```
///
/// + `{functionSignature}` - The signature of the `assertX(...)` function being
///   called. The trailing `_:file:line:` of the signature is when the failure
///   message is prepared.
/// + `{assertionMessage}` - Information related to the assertion done, like
///   expected values. Can be ommited when failure is obvious or no more
///   information can be provided, E.g. `bool.assertTrue()`
/// + `{addMessage}` - Addional messages provided at the assertion call, E.g.
///   `false.assertTrue("additional message")`. For custom assertions that
///   internally perform other assertions, a collection of additional messages
///   can be provided. When the failure message is prepared all messages are
///   separated with dashes ` - `.
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

