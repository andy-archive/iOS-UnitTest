//
//  LoginUpdateViewController.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/11/23.
//

import UIKit

//MARK: - User Entitiy
struct User {
    let email: String
    let password: String
    let check: String
}

//MARK: - Validator Entity
struct Validator {
    func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.count >= 6
    }
    
    func isValidPassword(password: String) -> Bool {
        return password.count >= 6 && password.count <= 12
        
    }
    
    func isEqualPassword(password: String, check: String) -> Bool {
        return password == check
    }
}

//MARK: - LoginUpdateViewController
final class LoginUpdateViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    
    //MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction private func loginButtonClicked(_ sender: UIButton) {
        
    }
}
