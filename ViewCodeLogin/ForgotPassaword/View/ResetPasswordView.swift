//
//  ResetPasswordView.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 18/06/22.
//

import UIKit

protocol ResetPasswordViewProtocol: AnyObject {
    func forgotPasswordAction()
    func backButtonAction()
}

class ResetPasswordView: UIView {

    weak private var delegate: ResetPasswordViewProtocol?
    
    func delegate(delegate: ResetPasswordViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.didTapBackButton), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    
    lazy var ResetPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Reset Password"
        return label
    }()
    
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = " Type your E-mail"
        return textField
    }()
    
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.didTapSendButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setUpConstraints()
        self.configBackGround()
        self.enableButton(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = .systemIndigo
    }
    
    private func addSubView() {
        self.addSubview(self.backButton)
        self.addSubview(self.ResetPasswordLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.sendButton)
}


    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate

    }
    
    public func getEmail()->String {
        return emailTextField.text ?? ""
    }
    
    public func validateTextField() {
        if emailTextField.text != "" {
            self.enableButton(true)
        } else {
            self.enableButton(false)
        }
    }
    
    private func enableButton(_ enable: Bool) {
        if enable {
            self.sendButton.isEnabled = true
            self.sendButton.setTitleColor(.white, for: .normal)
        } else {
            self.sendButton.isEnabled = false
            self.sendButton.setTitleColor(.lightGray, for: .normal)
        }
    }

    @objc private func didTapBackButton() {
        self.delegate?.backButtonAction()
    }
    
    @objc private func didTapSendButton() {
        self.delegate?.forgotPasswordAction()
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                        
            self.ResetPasswordLabel.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 10),
            self.ResetPasswordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.ResetPasswordLabel.bottomAnchor, constant: 50),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            self.sendButton.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 25),
            self.sendButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.sendButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.sendButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
        ])
    }
}
