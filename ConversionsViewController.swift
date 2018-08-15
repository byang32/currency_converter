//
//  ConversionsViewController.swift
//  LP3_currencyConverte_byang32
//
//  Created by Bee Yang on 12/4/17.
//  Copyright © 2017 Assignment3 Bee Yang. All rights reserved.
//

import UIKit

class ConversionsViewController: UITableViewController {

    let conversionTypes = ["Distance - Land", "Distance - Sea", "Currency", "Temperture", "Food", "Speed", "Weight"]
    
    var myIndex = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return conversionTypes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = conversionTypes[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        if indexPath.row == 2 {
        performSegue(withIdentifier: "segue", sender: self)
        
        } else {
            
            print(myIndex)
        }
    }

}
