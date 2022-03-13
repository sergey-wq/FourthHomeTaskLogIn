//
//  MoreInfoViewController.swift
//  LogInHomeTaskUiKit
//
//  Created by Sergey Runovich on 13.03.22.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!

    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(
            topColor: UIColor.white,
            bottomColor: UIColor.green
        )

        catImageView.image = user?.person.catImage
        catImageView.layer.cornerRadius = 20
    }
}
