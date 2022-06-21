//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 18/06/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        self.loginView = LoginView()
        self.view = self.loginView
        self.loginView?.backgroundColor = .systemIndigo
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView?.configtextFieldDelegate(delegate: self)
        self.loginView?.delegate(delegate: self)
        auth = Auth.auth()
        self.alert = AlertController(controller: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginViewController: LoginViewProtocol {
    func joinButtonAction() {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func ForgotPasswordAction() {
        let vc = ResetPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loginButtonAction() {
        guard let login = loginView else { return }
        
        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
            if error != nil {
                self.alert?.setup(title: "Ops", message: error?.localizedDescription ?? "Something Wrong")
            } else {
                if user == nil {
                    self.alert?.setup(title: "Ops", message: "Something Wrong")
                } else {
                    DispatchQueue.main.async {
                        let vc = FirstScreenViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        })
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count == 0 {
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.red.cgColor

        }else{
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
                self.loginView?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.loginView?.emailTextField {
            self.loginView?.passwordTextField.becomeFirstResponder()
        } else if textField == self.loginView?.passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)

}

}
