//
//  AboutUserViewController.swift
//  LogInHomeTaskUiKit
//
//  Created by Sergey Runovich on 13.03.22.
//

import UIKit

class AboutMeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var professionLabel: UILabel!
    @IBOutlet private weak var hobbyLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!

    // MARK: - Public Properties
    var user: User?

    // MARK: - Live Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(
            topColor: UIColor.white,
            bottomColor: UIColor.green
        )
        configureUI()
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.user = user
    }

    // MARK: - Private Methods
    private func configureUI() {
        guard let userInfo = user?.person else { return }

        birthdayLabel.text = "Birthday: \(userInfo.birthday)"
        ageLabel.text = "Age: \(userInfo.age)"
        professionLabel.text = "Profession: \(userInfo.profession)"
        hobbyLabel.text = "Hobby: \(userInfo.hobby)"
        countryLabel.text = "Country: \(userInfo.country)"
        cityLabel.text = "City: \(userInfo.city)"
    }
}
