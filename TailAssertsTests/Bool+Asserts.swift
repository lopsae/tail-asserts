//
//  TailAssertsTests
//


extension Bool {

    func assertTrue(
        _ message: @autoclosure Message = .init(),
        file: StaticString = #file, line: UInt = #line)
    {
        if self == true { return }

        Failure.trigger(
            message: message(),
            function: #function, file: file, line: line)
    }

}
