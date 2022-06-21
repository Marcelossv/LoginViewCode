//
//  SignUpViewController.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 20/06/22.
//

import UIKit
import FirebaseAuth


class SignUpViewController: UIViewController {

    var signup: SignUpView?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        self.signup = SignUpView()
        self.view = self.signup
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signup?.configtextFieldDelegateSignUp(delegate: self)
        self.signup?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = AlertController(controller: self)
    }
    
    func showAlert() {
        alert?.setup(title: "Ops", message: "Password different")
    }
    
}
    extension SignUpViewController: UITextFieldDelegate {
        
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
                    self.signup?.validateTextField()
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == self.signup?.emailTextField {
                self.signup?.passwordTextField.becomeFirstResponder()
            } else if textField == self.signup?.passwordTextField && ((self.signup?.confirmTextField) != nil){
                textField.resignFirstResponder()
            }
            return true
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)

    }

        
    }
//
extension SignUpViewController: SignUpViewProtocol {
    func tappedBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    

    func tappedRegisterAction() {
        guard let register = signup else {return}
        
        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { sucess, error in
            if error != nil {
                self.alert?.setup(title: "Ops", message: error?.localizedDescription ?? "Something Error")
            } else {
                self.alert?.setup(title: "Well Done", message: "User Created!")
            }
        })
        
    }
}
