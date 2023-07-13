//
//  EmployeeInfoScreenViewController.swift
//  Employees Info App
//
//  Created by Mac on 13/07/23.
//

import Foundation
import UIKit

class EmployeeInfoScreenViewController : UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var eifirstNameTF: UITextField!
    
    @IBOutlet weak var eilastNameTF: UITextField!
    
    @IBOutlet weak var eiageTF: UITextField!
    
    @IBOutlet weak var eiaddressTF: UITextField!
    
    @IBOutlet weak var eicityTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveToHomeScreen(_ sender: UIButton) {
        defaults.set(eifirstNameTF.text ?? "", forKey: "FirstName")
        defaults.set(eilastNameTF.text ?? "", forKey: "LastName")
        defaults.set(eiageTF.text ?? "", forKey: "Age")
        defaults.set(eiaddressTF.text ?? "", forKey: "Address")
        defaults.set(eicityTF.text ?? "", forKey: "City")
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
