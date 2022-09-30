//
//  TailAsserts
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(hue: 0, saturation: 0, brightness: 0.9, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text = "TailAsserts\n▶️ Running ▶️"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

