//
//  TailAssertsTests
//


extension Optional {

    func assertNil(
        _ message: @autoclosure Message = .init(),
        file: StaticString = #file, line: UInt = #line)
    {
        if case .none = self { return }

        // TODO: unwrap for printing
        Failure.trigger(message: """
            self expected to be nil;
            + self: \(String(describing: self))
            """,
            // TODO: this will cause empty messages
            otherMessages: [message()],
            function: #function, file: file, line: line)
    }


    @discardableResult
    func assertExists(
        _ message: @autoclosure Message = .init(),
        file: StaticString = #file, line: UInt = #line)
    -> Optional {
        if case .some(_) = self {
            return self
        }

        Failure.trigger(message: "`self` expected to exist",
            // TODO: this will cause empty messages
            otherMessages: [message()],
            function: #function, file: file, line: line)
        return self
    }

}

