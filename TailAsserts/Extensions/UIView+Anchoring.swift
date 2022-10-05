//
//  TailAsserts
//


import UIKit


extension UIView {

    var anchoring: Anchoring { Anchoring(view: self) }

}


struct Anchoring {

    let view: UIView

    func lead(toSafe harbor: UIView, inset: CGFloat = 0) {
        lead(to: harbor.safeAreaLayoutGuide.leadingAnchor, inset: inset)
    }

    func lead(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = 0) {
        view.leadingAnchor.constraint(equalTo: anchor, constant: inset)
            .isActive = true
    }

    func trail(toSafe harbor: UIView, inset: CGFloat = 0) {
        trail(to: harbor.safeAreaLayoutGuide.trailingAnchor, inset: inset)
    }

    func trail(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = 0) {
        view.trailingAnchor.constraint(equalTo: anchor, constant: -inset)
            .isActive = true
    }

    func top(toSafe harbor: UIView) {
        top(to: harbor.safeAreaLayoutGuide.topAnchor)
    }

    func top(to anchor: NSLayoutYAxisAnchor) {
        view.topAnchor.constraint(equalTo: anchor)
            .isActive = true
    }

    func bottom(toSafe harbor: UIView) {
        bottom(to: harbor.safeAreaLayoutGuide.bottomAnchor)
    }

    func bottom(to anchor: NSLayoutYAxisAnchor) {
        view.bottomAnchor.constraint(equalTo: anchor)
            .isActive = true
    }

    func center(toSafe harbor: UIView) {
        middle(toSafe: harbor)
        median(toSafe: harbor)
    }


    // Middle reffers to the centerX, center from side to side.

    func middle(to harbor: UIView) {
        middle(to: harbor.centerXAnchor)
    }

    func middle(toSafe harbor: UIView) {
        middle(to: harbor.safeAreaLayoutGuide.centerXAnchor)
    }

    func middle(to anchor: NSLayoutXAxisAnchor) {
        view.centerXAnchor.constraint(equalTo: anchor)
            .isActive = true
    }


    // Median reffers to the centerY, from the typographical median from top to bottom

    func median(to harbor: UIView) {
        median(to: harbor.centerYAnchor)
    }

    func median(toSafe harbor: UIView) {
        median(to: harbor.safeAreaLayoutGuide.centerYAnchor)
    }

    func median(to anchor: NSLayoutYAxisAnchor) {
        view.centerYAnchor.constraint(equalTo: anchor)
            .isActive = true
    }

}
