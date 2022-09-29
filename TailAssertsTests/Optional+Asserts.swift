//
//  TailAssertsTests
//


extension Optional {

    func assertNil(
        _ message: @autoclosure Message = .init(),
        file: StaticString = #file, line: UInt = #line)
    {
        if case .none = self { return }

        Failure.trigger(message: """
            self expected to be nil;
            + self: \(String(describing: self))
            """,
            // TODO: this will cause empty messages
            otherMessages: [message()],
            function: #function, file: file, line: line)
    }

}

