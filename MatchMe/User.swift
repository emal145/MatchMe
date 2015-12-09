//
//  User.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 01.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class User{
    
    var username:String = "";
    var name:String = "";
    var surname:String = "";
    var password:String = "";
    var city:String = "";
    var birthDay: Int = 0;
    var birthMonth:Int = 0;
    var birthYear:Int = 0;
    var description:String = "";
    var food:String = "";
    var hobbies:String = "";
    var height = "";
    var imageParh = "";
    var user = [NSManagedObject]()
    
    func setUserInfo(userinfo : [String]){
       username = userinfo[0];
        name = userinfo[1];
        surname = userinfo[2];
        password = userinfo[3];
        city = userinfo[4]
        birthDay = Int(userinfo[5])!
        birthMonth = Int(userinfo[6])!
        birthYear = Int(userinfo[7])!;
        description = userinfo[8]
        food = userinfo[9]
        hobbies = userinfo[10]
        height = userinfo[11];
    }
    
    

}