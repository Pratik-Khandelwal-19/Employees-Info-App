//
//  ViewController.swift
//  Employees Info App
//
//  Created by Mac on 10/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            pushToHomeScreen()
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if (usernameTF.text == UserDefaults.standard.string(forKey: "UserName")) && (passwordTF.text == UserDefaults.standard.string(forKey: "Password")) {
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            pushToHomeScreen()
        }
        
        else {
            print("Error")
        }
    }
    
    func pushToHomeScreen() {
        if let homeScreenVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
            self.navigationController?.pushViewController(homeScreenVc, animated: true)
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if let signupVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            self.navigationController?.pushViewController(signupVc, animated: true)
        }
        else {
            print("Error")
        }
    }
}
    





