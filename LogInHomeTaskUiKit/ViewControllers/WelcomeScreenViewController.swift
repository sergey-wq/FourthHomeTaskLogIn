//
//  WelcomeScreenViewController.swift
//  LogInHomeTaskUiKit
//
//  Created by Sergey Runovich on 8.03.22.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet private weak var welcomeUserLabel: UILabel!

    // MARK: - Public Properties
    var user = ""

    // MARK: - Private Properties
    private let primaryColor = UIColor(
        red: 220/255,
        green: 159/255,
        blue: 128/255,
        alpha: 1
    )

    private let secondaryColor = UIColor(
        red: 97/255,
        green: 118/255,
        blue: 230/255,
        alpha: 1
    )

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeUserLabel.text = "Welcome, \(user)!"
    }
}

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

