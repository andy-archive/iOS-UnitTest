//
//  LoginViewController.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/11/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var checkTextField: UITextField!
    
    //MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction private func loginButtonClicked(_ sender: UIButton) {
        if isValidEmail() && isValidPassword() &&
            isEqualPassword() {
            print("SUCCESS")
        } else {
            print("FAILED")
        }
    }
    
    //MARK: - Business Logic
    private func isValidEmail() -> Bool {
        guard let check = emailTextField.text else {
            return false
        }
        return check.contains("@") && check.count >= 6
    }
    
    private func isValidPassword() -> Bool {
        guard let check = emailTextField.text else {
            return false
        }
        return check.count <= 12
        
    }
    
    private func isEqualPassword() -> Bool {
        guard let password = passwordTextField.text,
              let check = checkTextField.text
        else {
            return false
        }
        return password == check
    }
}
