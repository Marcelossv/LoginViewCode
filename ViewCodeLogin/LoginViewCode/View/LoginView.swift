//
//  LoginView.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 18/06/22.
//

import UIKit
import TransitionButton
import ShowPasswordTextField

protocol LoginViewProtocol: AnyObject {
    func ForgotPasswordAction()
    func loginButtonAction()
    func joinButtonAction()
}

class LoginView: UIView {
    
    weak private var delegate: LoginViewProtocol?
    func delegate(delegate: LoginViewProtocol?) {
        self.delegate = delegate
    }

    lazy var logoImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image")
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 7
        textField.keyboardType = .emailAddress
        textField.placeholder = "Type your E-mail"
        textField.layer.borderWidth = 1.0
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textColor = .darkGray
        return textField
        }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 7
        textField.keyboardType = .emailAddress
        textField.placeholder = "Type your password"
        textField.layer.borderWidth = 1.0
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textColor = .darkGray
        return textField
        }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot your Password?", for: .normal)
        button.addTarget(self, action: #selector(self.tappedPasswordAction), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(self.tappedLoginButtonAction), for: .touchUpInside)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 7
        return button
    }()
    
    lazy var joinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Do not have an account? Sign Up", for: .normal)
        button.addTarget(self, action: #selector(self.tappedJoinButtonAction), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setupConstraintes()
        self.enableButton(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = .cyan
    }
    
    private func addSubView() {
        self.addSubview(self.logoImage)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.forgotPasswordButton)
        self.addSubview(self.loginButton)
        self.addSubview(self.joinButton)
    }
    
    public func configtextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    public func getEmail()->String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword()->String {
        return passwordTextField.text ?? ""
    }
    
    public func validateTextField() {
        if emailTextField.text != "" && passwordTextField.text != ""{
            self.enableButton(true)
        } else {
            self.enableButton(false)
        }
    }
    
    private func enableButton(_ enable: Bool) {
        if enable {
            self.loginButton.isEnabled = true
            self.loginButton.setTitleColor(.white, for: .normal)
            } else {
            self.loginButton.isEnabled = false
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            }
        }
    
    @objc private func tappedPasswordAction() {
        self.delegate?.ForgotPasswordAction()
    }
    @objc private func tappedLoginButtonAction() {
        self.delegate?.loginButtonAction()
    }
    
    @objc private func tappedJoinButtonAction() {
        self.delegate?.joinButtonAction()
    }
    
    private func setupConstraintes() {
        NSLayoutConstraint.activate([
        
            self.logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 20),
            self.logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30),
            self.logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            self.logoImage.heightAnchor.constraint(equalToConstant: 180),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 40),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 5),
            self.forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.loginButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor,constant: 25),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.joinButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            self.joinButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.joinButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.joinButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor)
        
        
        ])
    }
    }
    
    
    
    
    
    
    

