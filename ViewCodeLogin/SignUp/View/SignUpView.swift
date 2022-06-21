//
//  SignUpView.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 20/06/22.
//

import UIKit

protocol SignUpViewProtocol: AnyObject {
    func tappedRegisterAction()
    func tappedBackButtonAction()
}

class SignUpView: UIView {
    
    weak private var delegate: SignUpViewProtocol?
    
    func delegate(delegate: SignUpViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        return button
    }()

    lazy var newAccount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "New Account"
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Type your E-mail"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "New password"
        return textField
    }()

    lazy var confirmTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textColor = .darkGray
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Confirm your password"
        return textField
    }()
    
     lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Creat Account", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(self.tappedButton), for: .touchUpInside)
        button.layer.cornerRadius = 7
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setUpConstraints()
        self.configBackGround()
        self.enableButton(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = .systemIndigo
    }
    
    private func addSubView() {
        self.addSubview(self.backButton)
        self.addSubview(self.newAccount)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.confirmTextField)
        self.addSubview(self.registerButton)
}

    public func getEmail()->String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword()->String {
        return passwordTextField.text ?? ""
    }
    
    public func getConfirmPassword()->String {
        return confirmTextField.text ?? ""
    }
    
    
    public func configtextFieldDelegateSignUp(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.confirmTextField.delegate = delegate
    }
    
    public func validateTextField() {
        if emailTextField.text != "" && passwordTextField.text != "" && confirmTextField.text != "" {
            if passwordTextField.text != confirmTextField.text{
                self.enableButton(true)
            }
            
        } else {
            self.enableButton(false)
        }
    }
    
    private func enableButton(_ enable: Bool) {
        if enable {
            self.registerButton.isEnabled = true
            self.registerButton.setTitleColor(.white, for: .normal)
            } else {
            self.registerButton.isEnabled = false
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            }
        }
    
    
    @objc private func tappedButton() {
        self.delegate?.tappedRegisterAction()
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.tappedBackButtonAction()
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
                        
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            self.newAccount.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.newAccount.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.newAccount.bottomAnchor, constant: 30),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            self.confirmTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.confirmTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.confirmTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.confirmTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            
            self.registerButton.topAnchor.constraint(equalTo: self.confirmTextField.bottomAnchor, constant: 25),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            
            
        ])
    }
    
}
