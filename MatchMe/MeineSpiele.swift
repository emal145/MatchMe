//
//  MeineSpiele.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 10.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation

class MeineSpiele: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var openMenu: UIBarButtonItem!
    @IBOutlet var playerTable: UITableView!
    var playerDescriptions = ["Ich liebe gutes Essen",  "Gute Filme sind ein muss!!", "Ich mag guten Humor!"]
    
    var row = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenu.target =  self.revealViewController()
        openMenu.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        playerTable.delegate = self;
        playerTable.dataSource = self;
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerDescriptions.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Kiplayer1", forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = playerDescriptions[row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.row = indexPath.row
        //self.revealViewController().performSegueWithIdentifier("playerView", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "playerView"){
            let svc = segue.destinationViewController as! SpielGegen;
            svc.selectedRow = self.row;
        }
    }
    
    

}