//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alertController = UIAlertController(title: "Invalid Register", message: e.localizedDescription, preferredStyle: .alert)
                    let OkAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertController.addAction(OkAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                else {
                    // Navigate to the ChatView
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        else {
            let alertController = UIAlertController(title: "Invalid Register", message: "You cannot leave empty fields. Please provide an input.", preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(OkAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
}
