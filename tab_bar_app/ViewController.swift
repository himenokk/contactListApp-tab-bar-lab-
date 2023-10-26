//
//  ViewController.swift
//  tab_bar_app
//
//  Created by Sanzhar Kiyassov on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfieldname: UITextField!
    
    @IBOutlet weak var textfieldnumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func additems(_ sender: Any) {
        let defaults = UserDefaults.standard
        


        let contactName = textfieldname.text!
        let contactNumber = textfieldnumber.text!
        
        let newContact = Contacts(name: contactName, number: contactNumber)
        
        do{
            if let data = defaults.data(forKey: "contactItemArray"){
                var array = try JSONDecoder().decode([Contacts].self, from: data)
                
                array.append(newContact)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "contactItemArray")
            }else{
                let encodedata = try JSONEncoder().encode([newContact])
                
                defaults.set(encodedata, forKey: "contactItemArray")
            }
            
        } catch{
            print("unable to encode \(error)")
        }
        textfieldname.text = ""
        textfieldnumber.text = ""
    }
    


}


