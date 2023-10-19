//
//  TailAssertsTests
//


import XCTest


/// Defines a format for assertion failures.
///
/// In general the format is made of these parts:
/// + `{functionSignature}` - The signature of the `assertX(...)` function being
///   called. The trailing `_:file:line:` of the signature is ommited when the
///   failure message is prepared.
/// + `{assertionMessage}` - Information related to the assertion done, like
///   expected values. Can be ommited when failure is obvious or no more
///   information can be provided, E.g. `bool.assertTrue()`
/// + `{otherMessages}` - Addional messages provided at the assertion call, E.g.
///   `false.assertTrue("additional message")`. For custom assertions that
///   internally perform other assertions, a collection of additional messages
///   can be provided. When the failure message is prepared all messages are
///   separated with dashes ` - `.
///
/// Failures are constructed in `assert` functions when a message is certain to
/// be printed, since the struct will contains the actual message strings for
/// the failure, not the autoclosures.
///
/// E.g.:
/// ```
/// // Without assertion message:
/// {functionSignature} failed
///
/// // With only assertionMessage:
/// {functionSignature} failed: {assertionMessage}
///
/// // With only additionalMessages:
/// {functionSignature} failed - {addlMessage} - {moreAddlMessage}
///
/// // With all messages:
/// {functionSignature} failed: {assertionMessage} - {addlMessage} - {moreAddlMessage}
/// ```
struct Failure {

    let function: StaticString
    let file: StaticString
    let line: UInt

    let message: String
    let otherMessages: [String]


    /// Returns a `Failure` with the given parameters.
    ///
    /// The `message` and `otherMessages` autoclosures are executed in order
    /// to create the `Failure` struct.
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


    /// Creates and fails `Failure` with the given parameters.
    ///
    /// The `message` and `otherMessages` autoclosures are executed in order
    /// to create the `Failure` struct.
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


    /// Builds and returns the complete message for this `Failure`.
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


    /// Triggers a `XCTFail` with the complete message for this `Failure`.
    func fail() {
        let completeMessage = makeMessage()

        // TODO: can this be abstracted to a protocol for testing?
        XCTFail(completeMessage, file: file, line: line)
    }

}

