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
    var user: User?

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(
            topColor: UIColor.green,
            bottomColor: UIColor.white
        )
        welcomeUserLabel.text = getUserInfo()
    }

    private func getUserInfo() -> String {
        guard let user = user else { return "" }

        return "Welcome, \(user.person.name) \(user.person.surname)!"
    }
}

