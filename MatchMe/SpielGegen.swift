//
//  SpielGegen.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 10.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
import UIKit

class SpielGegen: UIViewController{
    
    @IBOutlet var openMenu:UIBarButtonItem!
    @IBOutlet var navTitle: UINavigationItem!
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var stateLbl: UILabel!
    @IBOutlet var rounds: UILabel!
    @IBOutlet var nextQuestion: UIButton!
    
    @IBOutlet var foodLbl: UILabel!
    @IBOutlet var hobbiesLbl: UILabel!
    @IBOutlet var cityLbl: UILabel!
    @IBOutlet var birthdayLbl: UILabel!
    @IBOutlet var heightLbl: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var chatSwitch: UISwitch!
    @IBOutlet var scrollViewer: UIScrollView!
    
    
    var users: Array<User> = []
    var user = User();
    var selectedRow:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenu.target =  self.revealViewController()
        openMenu.action = Selector("revealToggle:")
        
        scrollViewer.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        loadUsers();
        print(selectedRow)
        user = users[selectedRow];

        navTitle.title = "Spiel gegen: \(user.username)";
        
        addUserInfoToView();
    }
    
    func addUserInfoToView(){
        usernameLbl.text = user.username;
        
        if(user.nameShow){
            nameLbl.text = user.name;
        }
        
        if(user.foodShow){
            foodLbl.text = user.food;
        }
        
        if(user.hobbiesShow){
            hobbiesLbl.text = user.hobbies
        }
        if(user.cityShow){
            cityLbl.text = user.city
        }
        
        if(user.heightShow){
            heightLbl.text = user.height
        }
        
        if(user.chatShow){
            chatSwitch.setOn(true, animated: true)
        }
        
        if(!user.onTurn){
            nextQuestion.enabled = true
        }
    }
    
    func loadUsers(){
        let user1 = User();
        user1.username = "xPx3";
        user1.name = "Max";
        user1.surname = "Mustermann"
        user1.city = "Bremen"
        user1.birthDay = 14
        user1.birthMonth = 8
        user1.birthYear = 1986;
        user1.description = "Ich liebe gutes Essen";
        user1.food = "Pizza, Hamburger"
        user1.hobbies = "Lesen, Musik, Konzerte"
        user1.height = "1.83"
        
        let user2 = User();
        user2.username = "blubberblubb";
        user2.name = "Peter";
        user2.surname = "Meyer"
        user2.city = "Hamburg"
        user2.birthDay = 5
        user2.birthMonth = 11
        user2.birthYear = 1990;
        user2.description = "Gute Filme sind ein muss!!";
        user2.food = "Sushi, Pasta"
        user2.hobbies = "Fitness, Musik, Party"
        user2.height = "1.76"
        
        let user3 = User();
        user3.username = "ladyM";
        user3.name = "Maria";
        user3.surname = "Ehlers"
        user3.city = "Köln"
        user3.birthDay = 12
        user3.birthMonth = 7
        user3.birthYear = 1993;
        user3.description = "Ich mag guten Humor!";
        user3.food = "Nudeln, Fisch"
        user3.hobbies = "Lesen, Spazieren, Feiern"
        user3.height = "1.65"

        users.append(user1)
        users.append(user2)
        users.append(user3)

        
    }
   
    
}

