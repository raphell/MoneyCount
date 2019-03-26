//
//  addBasicPersonViewController.swift
//  MoneyCount
//
//  Created by Raphael LUCIANO on 26/03/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class addBasicPersonViewController: UIViewController {

    @IBOutlet weak var firstNameEntry: UITextField!
    @IBOutlet weak var lastNameEntry: UITextField!
    @IBOutlet weak var phoneEntry: UITextField!
    
    @IBOutlet weak var globalView: UIView!
    
    
    @IBAction func createNewPerson(_ sender: Any) {
        let newPerson = Person(context: CoreDataManager.context)
        newPerson.nom = lastNameEntry.text
        newPerson.prenom = firstNameEntry.text
        newPerson.telephone = phoneEntry.text
        NSLog("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
        CoreDataManager.save()
        NSLog("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB")
        //self.dismiss(animated: true, completion: nil)
        //self.dismiss(animated: true, completion: nil)
        //self.presentingViewController?.dismiss(animated: true, completion: nil)
        //self.navigationController?.popViewController(animated: true)
        performSegue(withIdentifier: "unwindToBasicList", sender: self)
         NSLog("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD")
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        globalView.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
