//
//  TailAsserts
//


import UIKit


extension UIView {

    var anchoring: Anchoring {
        translatesAutoresizingMaskIntoConstraints = false
        return Anchoring(view: self)
    }

}


struct Anchoring {

    let view: UIView

    @discardableResult
    func lead(toSafe harbor: UIView, inset: CGFloat = 0) -> Anchoring {
        return lead(to: harbor.safeAreaLayoutGuide.leadingAnchor, inset: inset)
    }

    @discardableResult
    func lead(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = 0) -> Anchoring {
        view.leadingAnchor.constraint(equalTo: anchor, constant: inset)
            .isActive = true
        return self
    }

    @discardableResult
    func trail(toSafe harbor: UIView, inset: CGFloat = 0) -> Anchoring {
        return trail(to: harbor.safeAreaLayoutGuide.trailingAnchor, inset: inset)
    }

    @discardableResult
    func trail(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = 0) -> Anchoring {
        view.trailingAnchor.constraint(equalTo: anchor, constant: -inset)
            .isActive = true
        return self
    }

    @discardableResult
    func top(toSafe harbor: UIView) -> Anchoring {
        return top(to: harbor.safeAreaLayoutGuide.topAnchor)
    }

    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor) -> Anchoring {
        view.topAnchor.constraint(equalTo: anchor)
            .isActive = true
        return self
    }

    @discardableResult
    func bottom(toSafe harbor: UIView) -> Anchoring {
        return bottom(to: harbor.safeAreaLayoutGuide.bottomAnchor)
    }

    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor) -> Anchoring {
        view.bottomAnchor.constraint(equalTo: anchor)
            .isActive = true
        return self
    }

    @discardableResult
    func center(toSafe harbor: UIView) -> Anchoring {
        return middle(toSafe: harbor).median(toSafe: harbor)
    }


    // Middle reffers to the centerX, center from side to side.

    @discardableResult
    func middle(to harbor: UIView) -> Anchoring {
        return middle(to: harbor.centerXAnchor)
    }

    @discardableResult
    func middle(toSafe harbor: UIView) -> Anchoring {
        return middle(to: harbor.safeAreaLayoutGuide.centerXAnchor)
    }

    @discardableResult
    func middle(to anchor: NSLayoutXAxisAnchor) -> Anchoring {
        view.centerXAnchor.constraint(equalTo: anchor)
            .isActive = true
        return self
    }


    // Median reffers to the centerY, from the typographical median from top to bottom

    @discardableResult
    func median(to harbor: UIView) -> Anchoring {
        return median(to: harbor.centerYAnchor)
    }

    @discardableResult
    func median(toSafe harbor: UIView) -> Anchoring {
        return median(to: harbor.safeAreaLayoutGuide.centerYAnchor)
    }

    @discardableResult
    func median(to anchor: NSLayoutYAxisAnchor) -> Anchoring {
        view.centerYAnchor.constraint(equalTo: anchor)
            .isActive = true
        return self
    }

}


// MARK: - Surrounding
extension Anchoring {

    @discardableResult
    func before(_ view: UIView, padding: CGFloat = 0) -> Anchoring {
        return before(anchor: view.leadingAnchor, padding: padding)
    }

    @discardableResult
    func before(anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> Anchoring {
        view.trailingAnchor.constraint(equalTo: anchor, constant: -padding)
            .isActive = true
        return self
    }

    @discardableResult
    func after(_ view: UIView, padding: CGFloat = 0) -> Anchoring {
        return after(anchor: view.trailingAnchor, padding: padding)
    }

    @discardableResult
    func after(anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> Anchoring {
        view.leadingAnchor.constraint(equalTo: anchor, constant: padding)
            .isActive = true
        return self
    }

    @discardableResult
    func above(_ view: UIView, padding: CGFloat = 0) -> Anchoring {
        return above(anchor: view.topAnchor, padding: padding)
    }

    @discardableResult
    func above(anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> Anchoring {
        view.bottomAnchor.constraint(equalTo: anchor, constant: -padding)
            .isActive = true
        return self
    }

    @discardableResult
    func below(_ view: UIView, padding: CGFloat = 0) -> Anchoring {
        return below(anchor: view.bottomAnchor, padding: padding)
    }

    @discardableResult
    func below(anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> Anchoring {
        view.topAnchor.constraint(equalTo: anchor, constant: padding)
            .isActive = true
        return self
    }

}
