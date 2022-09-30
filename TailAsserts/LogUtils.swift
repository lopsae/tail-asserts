//
//  TailAsserts
//

import UIKit


enum LogUtils {

    static func details(for configuration: UISceneConfiguration) -> String {
        let nameString = configuration.name.describe(or: "no-name")
        let delegateString = configuration.delegateClass.describe(or: "no-delegate")
        return "name:\(nameString) delegate:\(delegateString)"
    }

}


