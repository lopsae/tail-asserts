//
//  TailAsserts
//


import UIKit


extension UIView {

    var anchoring: Anchoring { Anchoring(view: self) }

}


struct Anchoring {

    let view: UIView

    func centerX(to harbor: UIView) {
        view.centerXAnchor.constraint(equalTo: harbor.centerXAnchor)
            .isActive = true
    }

    func centerX(to anchor: NSLayoutXAxisAnchor) {
        view.centerXAnchor.constraint(equalTo: anchor)
            .isActive = true
    }


    func centerY(to harbor: UIView) {
        view.centerYAnchor.constraint(equalTo: harbor.centerYAnchor)
            .isActive = true
    }

    func centerY(to anchor: NSLayoutYAxisAnchor) {
        view.centerYAnchor.constraint(equalTo: anchor)
            .isActive = true
    }

}
