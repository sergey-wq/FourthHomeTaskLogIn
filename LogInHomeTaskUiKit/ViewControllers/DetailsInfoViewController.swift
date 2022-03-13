//
//  DetailsInformationViewController.swift
//  LogInHomeTaskUiKit
//
//  Created by Sergey Runovich on 13.03.22.
//

import UIKit

class DetailsInfoViewController: UIViewController {

    @IBOutlet private weak var carImageView: UIImageView!

    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(
            topColor: UIColor.white,
            bottomColor: UIColor.green
        )

        carImageView.layer.cornerRadius = 20
        carImageView.image = user?.person.carImage
    }
}
