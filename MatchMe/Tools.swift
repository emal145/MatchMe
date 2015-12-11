//
//  Tools.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 10.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation

struct Tools {
    
    
    func loadData(filename:String) -> User{
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [NSString]
        
        let path = dirs[0].stringByAppendingPathExtension("\(filename).csv");
        let user = User();
        
        if (path != nil) {
            do{
                
                let tempUserString = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding);
                let userInfo = tempUserString.componentsSeparatedByString("##$%")
                
                user.setUserInfo(userInfo);
                return user;
                
            }catch{
                
            }
        }
        return user;
    }

    func readFile(filename:String)->String{
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [NSString]
        
        let path = dirs[0].stringByAppendingPathExtension("\(filename).csv");
        if (path != nil) {
            do{
                
                let tempUserString = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding);
                return tempUserString;
                
            }catch{
                
            }
        }

        return "";
        
    }
    
    func writeToFile(filename:String, tempUserString:String)->Bool{
        
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [NSString]
        
        let path = dirs[0].stringByAppendingPathExtension("\(filename).csv");
        
        if (path != nil) {
            do{
                try tempUserString.writeToFile(path!, atomically: true, encoding: NSUTF8StringEncoding);
                return true
            }catch{
                
            }
        }

        return false
    }
    
    func addToFile(filename:String, temp:String){
        
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [NSString]
        
        let path = dirs[0].stringByAppendingPathExtension("\(filename).csv");
        
        if (path != nil) {
            do{
                let oldData = readFile(filename)
                let newData = "\(oldData)##$%\(temp)"
                try newData.writeToFile(path!, atomically: true, encoding: NSUTF8StringEncoding);
            }catch{
                
            }
        }

    }
}