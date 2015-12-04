//
//  Menu.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 02.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import UIKit

class Menu: UIViewController {

    @IBOutlet var Open: UIBarButtonItem!
    @IBOutlet var Label: UILabel!
    
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Open.target =  self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if(varView == 0){
            Label.text = "Stringgs"
        }
        else{
            Label.text = "otherss"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}