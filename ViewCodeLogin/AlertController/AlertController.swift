//
//  AlertController.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 20/06/22.
//
import Foundation
import UIKit

class AlertController{

    private var controller: UIViewController?
    private var alertController: UIAlertController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    

    func setup(title:String, message: String, okText: String = "Close", completion: (()-> Void)? = nil) {
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let actionOk: UIAlertAction = UIAlertAction(title: okText, style: .default) { _ in
            completion?()
        }
        
        self.alertController?.addAction(actionOk)
        
        self.display()
    }
    
    private func display() {
        guard let alertController = self.alertController else { return }
        
        self.controller?.present(alertController, animated: true)
    }
}

