//
//  HomeScreenViewController.swift
//  Employees Info App
//
//  Created by Mac on 12/07/23.
//

import UIKit

class HomeScreenViewController: UIViewController  {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var EmployeeDetailsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmployeeDetailsCollectionView.dataSource = self
        EmployeeDetailsCollectionView.delegate = self
        postApiCall()
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        if let employeeInfoVc = self.storyboard?.instantiateViewController(withIdentifier: "EmployeeInfoScreenViewController") as? EmployeeInfoScreenViewController {
            self.navigationController?.pushViewController(employeeInfoVc, animated: true)
        }
        else {
            print("Error")
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    func postApiCall() {
        let params = [
            "email": "eve.holt@reqres.in" ,
            "password": "a"
        ]
        
        guard let url = URL(string: "https://reqres.in/api/login")
        else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody =  try? JSONSerialization.data(withJSONObject: params)
        
        let session = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let error = error {
                print("Error = \(error.localizedDescription)")
            }
            else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!)
                print("Response = \(jsonRes)")
            }
        }.resume()
        
    }
    
}

extension HomeScreenViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.EmployeeDetailsCollectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeDetailsCollectionViewCell", for: indexPath) as? EmployeeDetailsCollectionViewCell else{
            return UICollectionViewCell()
        }
        if let firstName = defaults.value(forKey: "FirstName") as? String,
           let lastName = defaults.value(forKey: "LastName") as? String,
           let age = defaults.value(forKey: "Age") as? String,
           let address = defaults.value(forKey: "Address") as? String,
           let city = defaults.value(forKey: "City") as? String
        {
            cell.hmfirstName.text = firstName
            cell.hmlastName.text = lastName
            cell.hmage.text = age
            cell.hmaddress.text = address
            cell.hmcity.text = city
        }
        EmployeeDetailsCollectionView.reloadData()
        return cell
    }
    
}

extension HomeScreenViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 300, height: 150)
    }
}


