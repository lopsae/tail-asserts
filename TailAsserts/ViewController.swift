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

        // TODO: Trailing setup?
//        UILabel().setupAdd(to: view) { label in
//        }

        let centerLabel = view.setupSubview(UILabel()) {
            label in
            label.text = "TailAsserts\n▶️ Running ▶️"
            label.numberOfLines = 0
            label.textAlignment = .center

            label.anchoring.center(toSafe: view)
        }

        // Around title labels

        view.setupSubview(UILabel(text: "above")) { label in
            label.anchoring
                .middle(to: centerLabel)
                .above(centerLabel, padding: 10)
        }

        view.setupSubview(UILabel(text: "below")) { label in
            label.anchoring
                .middle(to: centerLabel)
                .below(centerLabel, padding: 10)
        }

        view.setupSubview(UILabel(text: "before")) { label in
            label.anchoring
                .before(centerLabel, padding: 10)
                .median(to: centerLabel)
        }

        view.setupSubview(UILabel(text: "after")) { label in
            label.anchoring
                .after(centerLabel, padding: 10)
                .median(to: centerLabel)
        }


        // Safe layout labels

        view.setupSubview(UILabel()) { label in
            label.text = "lead"
            label.textAlignment = .center
//            label.transform = CGAffineTransform(rotationAngle: -.pi/2)

            label.anchoring
                .lead(toSafe: view, inset: 10)
                .median(toSafe: view)
        }

        view.setupSubview(UILabel()) { label in
            label.text = "trail"
            label.textAlignment = .center
//            label.transform = CGAffineTransform(rotationAngle: -.pi/2)

            label.anchoring
                .trail(toSafe: view, inset: 10)
                .median(toSafe: view)
        }

        view.setupSubview(UILabel()) { label in
            label.text = "top label"
            label.textAlignment = .center

            label.anchoring
                .middle(to: view)
                .top(toSafe: view)
        }

        view.setupSubview(UILabel()) { label in
            label.text = "bottom label"
            label.textAlignment = .center

            label.anchoring
                .middle(to: view)
                .bottom(toSafe: view)
        }
    }


}

