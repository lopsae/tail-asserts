//
//  TailAsserts
//


import UIKit


extension UIView {

    func setupSubview<V>(_ subview: V, configure: (V) -> Void) where V: UIView {
        addSubview(subview)
        configure(subview)
    }

}

