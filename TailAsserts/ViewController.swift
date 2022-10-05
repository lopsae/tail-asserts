//
//  TailAsserts
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // A light gray
        view.backgroundColor = .init(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false

        view.setupSubview(UILabel()) { label in
            label.text = "TailAsserts\n▶️ Running ▶️"
            label.numberOfLines = 0
            label.textAlignment = .center

            label.translatesAutoresizingMaskIntoConstraints = false
            label.anchoring.centerX(to: view)
            label.anchoring.centerY(to: view)
        }
    }


}

