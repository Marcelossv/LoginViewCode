//
//  FirstScreenControllerViewController.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 20/06/22.
//

import UIKit
import FirebaseAuth

class FirstScreenViewController: UIViewController {

    var firstScreen: FirstScreenView?
    var auth:Auth?
    var alert: AlertController?
    

    override func loadView() {
        self.firstScreen = FirstScreenView()
        self.view = self.firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        alert = AlertController(controller: self)
        firstScreen?.delegate(delegate: self)
    }
    
}

extension FirstScreenViewController: FirstScreenViewProtocol {
    func tappedLogOutButtonAction() {
        do {
            try auth?.signOut()
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } catch _ {
            alert?.setup(title: "Ops", message: "Something wrong, Try another time")
        }
    }
    
    
}
