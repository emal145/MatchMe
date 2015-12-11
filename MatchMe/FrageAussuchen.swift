//
//  FrageAussuchen.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 10.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation

class FrageAussuchen: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var openMenu: UIBarButtonItem!
    @IBOutlet var questionTable: UITableView!
    
    var questionsModel = QuestionModel();
    var questions:Array<Question> = []
    var row = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenu.target =  self.revealViewController()
        openMenu.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        questionTable.delegate = self;
        questionTable.dataSource = self;
        
        questions  = questionsModel.questions;
        questionTable.estimatedRowHeight = 89
        questionTable.rowHeight = UITableViewAutomaticDimension
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("question1", forIndexPath: indexPath) as UITableViewCell
        
        row = indexPath.row
        cell.textLabel?.text = questions[row].question
        
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