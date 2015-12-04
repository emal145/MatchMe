//
//  LoggedIn.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 01.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
import UIKit

class LoggedIn: UIViewController {
    
    
    @IBOutlet var Open: UIBarButtonItem!
  
    var currentUser : User!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Open.target =  self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
}