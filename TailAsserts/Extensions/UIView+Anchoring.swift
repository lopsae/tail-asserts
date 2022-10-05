//
//  TailAsserts
//


import UIKit


extension UIView {

    var anchoring: Anchoring { Anchoring(view: self) }

}


struct Anchoring {

    let view: UIView

    func topY(toSafe harbor: UIView) {
        topY(to: harbor.safeAreaLayoutGuide.topAnchor)
    }

    func topY(to anchor: NSLayoutYAxisAnchor) {
        view.topAnchor.constraint(equalTo: anchor)
            .isActive = true
    }

    func bottomY(toSafe harbor: UIView) {
        bottomY(to: harbor.safeAreaLayoutGuide.bottomAnchor)
    }

    func bottomY(to anchor: NSLayoutYAxisAnchor) {
        view.bottomAnchor.constraint(equalTo: anchor)
            .isActive = true
    }

    func centerX(to harbor: UIView) {
        centerX(to: harbor.centerXAnchor)
    }

    func centerX(toSafe harbor: UIView) {
        centerX(to: harbor.safeAreaLayoutGuide.centerXAnchor)
    }

    func centerX(to anchor: NSLayoutXAxisAnchor) {
        view.centerXAnchor.constraint(equalTo: anchor)
            .isActive = true
    }


    func centerY(to harbor: UIView) {
        centerY(to: harbor.centerYAnchor)
    }

    func centerY(toSafe harbor: UIView) {
        centerY(to: harbor.safeAreaLayoutGuide.centerYAnchor)
    }

    func centerY(to anchor: NSLayoutYAxisAnchor) {
        view.centerYAnchor.constraint(equalTo: anchor)
            .isActive = true
    }

}
