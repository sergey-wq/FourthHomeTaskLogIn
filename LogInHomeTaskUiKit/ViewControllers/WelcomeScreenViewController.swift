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
    var name = ""

    // MARK: - Live Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        welcomeUserLabel.text = "Welcome, \(name)!"
    }

    // MARK: - IB Actions
    @IBAction func backButtonAction() {
        NotificationCenter.default.post(name: GlobalStrings.comeBackToStartScreen, object: nil)
        dismiss(animated: true) 
    }

    // MARK: - Private Methods
    private func setGradientBackground() {
        let colorTop =  UIColor.blue.cgColor
        let colorBottom = UIColor.green.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

