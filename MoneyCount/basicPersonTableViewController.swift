//
//  basicPersonTableViewController.swift
//  MoneyCount
//
//  Created by Raphael LUCIANO on 26/03/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit
import CoreData


class basicPersonTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var personTable: UITableView!
    
    
    @IBAction func unwindToBasicList(sefue: UIStoryboardSegue){
        
    }
    
    
    
    
    fileprivate lazy var basicPersonFetched : NSFetchedResultsController<Person> = {
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.nom), ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        return fetchResultController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try self.basicPersonFetched.performFetch()
        }
        catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.personTable.dequeueReusableCell(withIdentifier: "basicPersonCell", for: indexPath) as! basicPersonTableViewCell
        let person = self.basicPersonFetched.object(at: indexPath)
        cell.firstName.text = person.prenom
        cell.lastName.text = person.nom
        //self.personPresenter.configure(theCell: cell, forPerson: person)
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    let segueInfoPersonId = "showInfoPersonSegue"
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == self.segueInfoPersonId{
            if let indexPath = self.personTable.indexPathForSelectedRow{
                let showInfoPersonViewController = segue.destination as! ShowInfoPersonViewController
                
                showInfoPersonViewController.myPersonToShow = self.basicPersonFetched.object(at: indexPath)
            }
        }
    }
    

}
