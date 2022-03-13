//
//  ViewController.swift
//  LogInHomeTaskUiKit
//
//  Created by Sergey Runovich on 8.03.22.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!

    // MARK: - Private Properties
    private let user = "User"
    private let password = "Password"

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeScreenViewController else { return }
        welcomeVC.user = user
    }

    // MARK: IBActions
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == user, userPasswordTextField.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: userPasswordTextField
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }

    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(user) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
    }
}

// MARK: - Alert Controller
extension StartViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard
extension StartViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userPasswordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
