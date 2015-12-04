//
//  BsckTableVC.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 02.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController{
    
    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["Start", "Profil", "Meine Spiele", "Logout"]
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = TableArray[indexPath.row]
        return cell
        
    }
}