//
//  ShowInfoPersonViewController.swift
//  MoneyCount
//
//  Created by Raphael LUCIANO on 26/03/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class ShowInfoPersonViewController: UIViewController {

    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    var myPersonToShow : Person? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let aPerson = self.myPersonToShow{
            self.firstNameLabel.text = aPerson.prenom
            self.lastNameLabel.text = aPerson.nom
            self.phoneLabel.text = aPerson.telephone
        }
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
