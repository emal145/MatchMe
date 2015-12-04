//
//  Profile.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 02.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation

class Profile : UIViewController{
    
    @IBOutlet var Open: UIBarButtonItem!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Open.target =  self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
}