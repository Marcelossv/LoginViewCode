//
//  FirstScreenApp.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 20/06/22.
//

import UIKit
protocol FirstScreenViewProtocol : AnyObject {
    func tappedLogOutButtonAction()
    
}

class FirstScreenView: UIView {

    weak private var delegate: FirstScreenViewProtocol?
    
    func delegate(delegate: FirstScreenViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Welcome!"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tappedLogout),for: .touchUpInside)
        button.setTitle("Logout", for: .normal)
        button.layer.cornerRadius = 7
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(UIColor.orange, for: .normal)
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setUpConstraints()
        self.configBackGround()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = .systemIndigo
    }
    
    private func addSubView() {
        self.addSubview(self.welcomeLabel)
        self.addSubview(self.logoutButton)
    
}
    
    @objc private func tappedLogout() {
        self.delegate?.tappedLogOutButtonAction()
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
                        
            self.welcomeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 350),
            self.welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoutButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            self.logoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
}
}
