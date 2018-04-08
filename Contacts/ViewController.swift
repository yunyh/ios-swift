//
//  ViewController.swift
//  contacts
//
//  Created by Young Hyub Yun on 2018. 4. 8..
//  Copyright © 2018년 YoungHyupYun. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func saveContacts(_ sender: Any) {
        let entityDescriotion = NSEntityDescription.entity(forEntityName: "Contacts", in: managedObjectContext)
        let contact = Contacts(entity: entityDescriotion!, insertInto: managedObjectContext)
        
        contact.name = nameTextField.text
        contact.address = addressTextField.text
        contact.phone = phoneTextField.text
        
        do{
            try managedObjectContext.save()
            nameTextField.text = nil
            addressTextField.text = nil
            phoneTextField.text = nil
            print("Save Success Contacts")
        } catch _ as NSError{
            print("Save Contacts => Fail save contacts")
        }
    }
    
    @IBAction func findContacts(_ sender: Any) {
        let fetch = NSFetchRequest<Contacts>(entityName: "Contacts")
        do{
            let requestName = "SSS"
            fetch.predicate = NSPredicate(format: "name == %@", requestName)
            let result = try managedObjectContext.fetch(fetch)
            
            for element in result{
                let name : String = element.name!
                if name.isEmpty {
                    print("Not Found")
                } else{
                    print(name)
                    nameTextField.text = name
                    addressTextField.text = element.address!
                }
            }
        } catch _ as NSError{
            print("find error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

