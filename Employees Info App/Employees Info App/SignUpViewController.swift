//
//  SignUpViewController.swift
//  Employees Info App
//
//  Created by Mac on 10/07/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmpasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveDetails()
    }
    
    @IBAction func signUp(_ sender: Any) {
        UserDefaults.standard.set(usernameTF.text, forKey: "UserName")
        UserDefaults.standard.set(emailTF.text, forKey: "Email")
        UserDefaults.standard.set(passwordTF.text, forKey: "Password")
        
        if (passwordTF.text == confirmpasswordTF.text) {
            UserDefaults.standard.set(confirmpasswordTF.text, forKey: "ConfirmPassword")
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        else {
            confirmpasswordTF.text = ""
        }
    }
    
    func retrieveDetails() {
        let username = UserDefaults.standard.string(forKey: "UserName")
        let password = UserDefaults.standard.string(forKey: "Password")
    }
    
}
