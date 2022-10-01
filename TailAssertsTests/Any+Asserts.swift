//
//  TailAssertsTests
//


// `Any` nor `AnyObject` can be extended, so these are global functions

@discardableResult
func assertType<A,T>(_ any: A, is type: T.Type,
    _ message: @autoclosure Message = .init(),
    file: StaticString = #file, line: UInt = #line)
-> T? {
    if let casted = any as? T {
        return casted
    }

    let typeString = String(describing: T.self)
    Failure.trigger(message: "`self` expected to be of type `\(typeString)`",
        // TODO: this will cause empty messages
        otherMessages: [message()],
        function: #function, file: file, line: line)
    return nil
}

