//
//  TailAssertsTests
//


extension String {

    // TODO: would this collide with future Sequence.assertStarts?
    func assertsStarts(with prefix: String,
       _ message: @autoclosure Message = .init(),
       file: StaticString = #file, line: UInt = #line)
    {
        if self.starts(with: prefix) { return }

        Failure.trigger(message: """
            `self` expected to start with prefix;
            + self:   \(self)
            + prefix: \(prefix)
            """,
            // TODO: this will cause empty messages
            otherMessages: [message()],
            function: #function, file: file, line: line)
    }

}
