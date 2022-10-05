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

        let label = UILabel()
        label.text = "TailAsserts\n▶️ Running ▶️"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        label.anchoring.centerX(to: view)
        label.anchoring.centerY(to: view)
    }


}

