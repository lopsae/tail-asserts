//
//  TailAsserts
//


extension Optional {

    func describe(or whenNil: String) -> String {
        if let unwrapped = self {
            return String(describing: unwrapped)
        }
        return whenNil
    }

}

