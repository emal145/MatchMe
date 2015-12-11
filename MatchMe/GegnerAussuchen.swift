//
//  GegnerAussuchen.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 10.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation

class GegnerAussuchen: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var openMenu: UIBarButtonItem!
    @IBOutlet var playerTable: UITableView!
    var playerDescriptions = ["Ich liebe gutes Essen", "Fussball ist super!", "Wer nicht wagt, der nicht gewinnt", "Gute Filme sind ein muss!!", "Ich mag guten Humor!"]
    
    let textCellIdentifier = "TextCell"
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
        let cell = tableView.dequeueReusableCellWithIdentifier("player1", forIndexPath: indexPath) as UITableViewCell
        
        row = indexPath.row
        cell.textLabel?.text = playerDescriptions[row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    @IBAction func continueGame(sender: AnyObject) {
        let tools = Tools()
        tools.addToFile("newGame", temp: "\(row)")
    }
    
}
