//
//  ResetPasswordControllerViewController.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 18/06/22.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController{

    var resetPassword: ResetPasswordView?
    var auth: Auth?
    var alert: AlertController?
    
    
    override func loadView() {
        self.resetPassword = ResetPasswordView()
        self.view = self.resetPassword
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetPassword?.configTextFieldDelegate(delegate: self)
        self.resetPassword?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = AlertController(controller: self)
        
    }
}

extension ResetPasswordViewController: ResetPasswordViewProtocol{
    func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func forgotPasswordAction() {
        guard let resetPassword = resetPassword else {return}
        
        auth?.sendPasswordReset(withEmail: resetPassword.getEmail() , completion: { error in
            if let error = error {
                self.alert?.setup(title: "Ops", message: error.localizedDescription)
            }
            self.alert?.setup(title: "Sucess", message: "E-mail Send check your box/Spam !")
        })
        
    }
    
}

extension ResetPasswordViewController: UITextFieldDelegate {
    
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
        self.resetPassword?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.resetPassword?.emailTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    }

extension ResetPasswordViewController {
    
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}
