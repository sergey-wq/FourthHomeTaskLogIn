//
//  User.swift
//  LogInHomeTaskUiKit
//
//  Created by Sergey Runovich on 13.03.22.
//

import Foundation
import UIKit

struct User {
    let name = "User"
    let password = "Password"
    let person: Person

    static func getData() -> User {
        User(
            person: Person(
                name: "Sergey",
                surname: "Runovich",
                age: "24",
                carImage: UIImage(named: "carImage"),
                catImage: UIImage(named: "catImage"),
                birthday: "16.05.1997",
                profession: "IOS Developer",
                hobby: "Training in gym",
                country: "Belarus",
                city: "Minsk"
            )
        )
    }
}

struct Person {
    let name : String
    let surname: String
    let age: String
    let carImage: UIImage?
    let catImage: UIImage?
    let birthday: String
    let profession: String
    let hobby: String
    let country: String
    let city: String
}
