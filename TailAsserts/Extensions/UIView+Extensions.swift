//
//  TailAsserts
//


import UIKit


extension UIView {

    @discardableResult
    func setupSubview<V>(_ subview: V, configure: (V) -> Void) -> V
    where V: UIView {
        addSubview(subview)
        configure(subview)
        return subview
    }

}

