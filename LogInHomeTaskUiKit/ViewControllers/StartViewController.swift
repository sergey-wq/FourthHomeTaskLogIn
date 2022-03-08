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
    private let name = "Steve"
    private let password = "password"

    // MARK: - Live Cycles Method
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        addObservers()
    }

    // MARK: - Overrides
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    // MARK: - IB Actions
    @IBAction private func logInAction() {
        checkUserData()
    }

    @IBAction private func forgetNameAction() {
        showAlert(title: "Oops!", message: "Your name is Steve 🥲", actions: .none)
    }

    @IBAction private func forgetPasswordAction() {
        showAlert(title: "Oops!", message: "Your password is password 😎", actions: .none)
    }

    // MARK: - Private Methods
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didBackFromWelcomeScreen(_:)), name: GlobalStrings.comeBackToStartScreen, object: nil)
    }

    @objc private func didBackFromWelcomeScreen(_ notification: NSNotification) {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
    }

    private func checkUserData() {
        if userNameTextField.text == name, userPasswordTextField.text == password {
            let storyBoard = UIStoryboard(name: GlobalStrings.storyboardName, bundle:nil)
            let welcomeScreen = storyBoard.instantiateViewController(withIdentifier: GlobalStrings.welcomeScreenIdentifier) as! WelcomeScreenViewController
            welcomeScreen.name = userNameTextField.text ?? ""
            welcomeScreen.modalPresentationStyle = .fullScreen
            self.present(welcomeScreen, animated: true)
        } else {
            showAlert(title: "Invalid name or password❗️", message: "Try again", actions: .none)
            userPasswordTextField.text = ""
        }
    }
}

// MARK: - UITextFieldDelegate
extension StartViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            checkUserData()
            return true
        }
        return false
     }
}

// MARK: - Helper Methods
extension StartViewController {

    private func showAlert(title: String, message: String, actions: [UIAlertAction]?, shouldShowOkAction: Bool = true, okHandler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            if let actions = actions {
                for action in actions {
                    alertController.addAction(action)
                }
            }

            if shouldShowOkAction {
                let okButton = UIAlertAction(title: "Ok", style: .default, handler: okHandler)
                okButton.setValue(UIColor.gray, forKey: "titleTextColor")
                alertController.addAction(okButton)
            }
            self.present(alertController, animated: true, completion: nil)
        }
    }

    private func configureTextFields() {
        userNameTextField.tag = 0
        userPasswordTextField.tag = 1

        userNameTextField.returnKeyType = UIReturnKeyType.next
        userPasswordTextField.returnKeyType = UIReturnKeyType.done

        userPasswordTextField.enablesReturnKeyAutomatically = true
    }
}
