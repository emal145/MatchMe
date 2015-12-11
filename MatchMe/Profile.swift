//
//  Profile.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 02.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
import UIKit

class Profile : UIViewController{
    
    @IBOutlet var Open: UIBarButtonItem!
    var user:User!;
    var tools = Tools();
   
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var nameTxt: UITextField!
    @IBOutlet var surname: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var cityTxt: UITextField!
    @IBOutlet var heightTxt: UITextField!
    @IBOutlet var descriptionTxt: UITextField!
    @IBOutlet var foodTxt: UITextView!
    @IBOutlet var hobbiesTxt: UITextView!
    
    var firstload = false;
    
   
    @IBOutlet var scrollviewer: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Open.target =  self.revealViewController()
        Open.action = Selector("revealToggle:")
        scrollviewer.contentSize.height = 1000
       self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        if(!firstload){
            user = tools.loadData("user")
           
            usernameTxt.text = user.username
            nameTxt.text = user.name
            surname.text = user.surname
            passwordTxt.text = user.password
            cityTxt.text = user.city
            heightTxt.text = user.height
            descriptionTxt.text = user.description
            foodTxt.text = user.food
            hobbiesTxt.text = user.hobbies
            
            firstload = true
        }
        
    }
    

    
    
}