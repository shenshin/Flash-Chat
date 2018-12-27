//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Ales Shenshin on 23/12/2018.
//  Copyright (c) 2018 Shenshin. All rights reserved.
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            if let authError = error {
                SVProgressHUD.dismiss()
                self.errorMessage.text = authError.localizedDescription
                self.errorMessage.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                
            } else {
                SVProgressHUD.dismiss()
                print("Пользователь заригистрован по email адресу: \(user!.user.email!)")
                self.errorMessage.text = ""
                self.errorMessage.backgroundColor = UIColor.clear
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        

        
        
    } 
    
    
}
