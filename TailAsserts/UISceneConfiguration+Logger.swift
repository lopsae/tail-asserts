//
//  TailAsserts
//

import UIKit


extension UISceneConfiguration {

    var logger: Logger<UISceneConfiguration> { return Logger(subject: self) }

}


struct Logger<Subject> {
    let subject: Subject
}

extension Logger where Subject: UISceneConfiguration {

    var details: String {
        let nameString = subject.name.describe(or: "no-name")
        let delegateString = subject.delegateClass.describe(or: "no-delegate")
        return "name:\(nameString) delegate:\(delegateString)"
    }

}

