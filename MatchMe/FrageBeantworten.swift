//
//  FrageBeantworten.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 10.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
class FrageBeantworten: UIViewController{
    
    @IBOutlet var openMenu: UIBarButtonItem!
    @IBOutlet var sliderValue: UILabel!
    @IBOutlet var questionTxtbox: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenu.target =  self.revealViewController()
        openMenu.action = Selector("revealToggle:")
        
    
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    
    @IBAction func sliderChanged(sender: UISlider) {
        sliderValue.text = "\(Int(sender.value))";
    }
    
    @IBAction func sendAnswer(sender: AnyObject) {
        
    }
    
    @IBAction func back(sender: AnyObject) {
        
    }
   
    
    
}