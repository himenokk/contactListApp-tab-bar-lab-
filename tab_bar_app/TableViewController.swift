//
//  TableViewController.swift
//  tab_bar_app
//
//  Created by Sanzhar Kiyassov on 25.10.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayText : [Contacts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
  
        do{
            if let data = defaults.data(forKey: "contactItemArray"){
                arrayText = try JSONDecoder().decode([Contacts].self, from: data)
                
               
            }
            
        } catch{
            print("unable to encode \(error)")
        }
        
//        if let array = defaults.array(forKey: "taskArray"){
//            arrayTask = array as! [String]
//        }
        
        tableView.reloadData()
    }
    
    func saveTasks(){
        let defaults = UserDefaults.standard
        do{
            
                
            let encodedata = try JSONEncoder().encode(arrayText)
                
            defaults.set(encodedata, forKey: "contactItemArray")
           
        } catch{
            print("unable to encode \(error)")
        }
        //defaults.set(arrayTask, forKey: "taskArray")
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayText.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")

        // Configure the cell...

        cell.textLabel?.text = arrayText[indexPath.row].name
        cell.detailTextLabel?.text = arrayText[indexPath.row].number
        
        
        
        return cell
    }
    

    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayText.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            saveTasks()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
