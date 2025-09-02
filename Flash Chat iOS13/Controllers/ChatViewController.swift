//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages : [Message] = [
        Message(sender: "1@2.com", message: "Hey"),
        Message(sender: "a@b.com", message: "Hello to you too !"),
        Message(sender: "x@y.com", message: "What are you all doing?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = K.appName
        navigationItem.hidesBackButton = true
        tableView.dataSource = self

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func signOutButton(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let error as NSError {
            let alertController = UIAlertController(title: "Problem in Signing Out", message: error.localizedDescription , preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(OkAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
}

extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].message
        return cell
        
    }
}

