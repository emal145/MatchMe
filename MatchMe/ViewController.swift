//
//  ViewController.swift
//  DoYou?
//
//  Created by Emel Altmisoglu on 12.11.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var usernametxtf: UITextField!
    
    @IBOutlet weak var passwordtxtf: UITextField!
    
    var user : User!;
    var userInfo:[String] = [];
    var logginAccepted:Bool = false;
    var loginErrorMessage:String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if(identifier == "loggedinView"){
            checkLoggin()
            
            if !logginAccepted {
            
                let notPermitted = UIAlertController(title: "Anmeldung Fehlgeschlagen!", message: "\(loginErrorMessage)", preferredStyle: .Alert)
                // shows alert to user
                 notPermitted.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                
                self.presentViewController(notPermitted, animated: true, completion: nil)
                // prevent segue from occurring
                return false
            }
            
        }
        // by default perform the segue transitio
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "loggedinView"){
            let svc = segue.destinationViewController as! LoggedIn;
            svc.currentUser = user;
        }
    }
    
    func loadData(){
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [NSString]
        
        let path = dirs[0].stringByAppendingPathExtension("user.csv");
        
        if (path != nil) {
            do{
                
                let tempUserString = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding);
                userInfo = tempUserString.componentsSeparatedByString("##$%")
                user.setUserInfo(userInfo);
        
                
            }catch{
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        
    func checkLoggin(){
        loadData();
        if(usernametxtf.text != "" && passwordtxtf.text != ""){
            if(userInfo.count <= 0){
                loginErrorMessage = "Fehler in der Anmeldung!"
            }
            else if(usernametxtf.text?.lowercaseString != userInfo[0].lowercaseString){
                loginErrorMessage = "Nutzer nicht vorhanden!"
            }
            else if(passwordtxtf.text != userInfo[3]){
               loginErrorMessage = "Falsches Password!"
            }
            else{
                logginAccepted = true;
                loginErrorMessage = "ANGEMELDET!"
            }
            
        }

    }
}

