//
//  Registration2.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 01.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
import UIKit

class Registration2: UIViewController, UITextFieldDelegate, UITextViewDelegate,UIScrollViewDelegate{
    
    @IBOutlet var personsHeighttxtf: UITextField!
    @IBOutlet var descriptiontxtf: UITextField!
    @IBOutlet var foodtxtf: UITextView!
    @IBOutlet var hobbiestxtf: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    var registrationUser: User!;
    var tools = Tools();
    
    @IBOutlet weak var scrollviewerReg2: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewTapped:")
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        scrollviewerReg2.addGestureRecognizer(tapRecognizer)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "backToRegistration"){
            let svc = segue.destinationViewController as! Registration1;
            svc.setRegistrationUsersInfo(registrationUser);
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        if(textView == foodtxtf || textView == hobbiestxtf){
            scrollviewerReg2.setContentOffset(CGPointMake(0,100), animated: true)
        }
        enableContinueBtnIfCompleted();
        
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView == foodtxtf || textView == hobbiestxtf){
            enableContinueBtnIfCompleted();
            scrollviewerReg2.setContentOffset(CGPointMake(0,0), animated: true)
        }
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(textField == personsHeighttxtf || textField == descriptiontxtf){
            self.view.endEditing(true)
            scrollviewerReg2.setContentOffset(CGPointMake(0,0), animated: true)
        }
        enableContinueBtnIfCompleted();
    }
    
    func enableContinueBtnIfCompleted(){
        if(personsHeighttxtf.text !=  "" && descriptiontxtf.text != "" && foodtxtf.text != "" && hobbiestxtf.text != ""){
            
            saveBtn.enabled = true;
        }
        else{
            saveBtn.enabled = false;
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        enableContinueBtnIfCompleted();
        return false;
    }
    
    func textViewShouldReturn(textField: UITextView) -> Bool {
        self.view.endEditing(true)
        enableContinueBtnIfCompleted();
        return false;
    }
    
    func scrollViewTapped(recognizer: UITapGestureRecognizer){
        self.view.endEditing(true)
        
    }
    
    func setRegistrationUsersInfo(user: User){
        registrationUser = user;
    }
    
    @IBAction func registerUser(sender: UIButton) {
        registrationUser.height = personsHeighttxtf.text!;
        registrationUser.description = descriptiontxtf.text!;
        registrationUser.food = foodtxtf.text!;
        registrationUser.hobbies = hobbiestxtf.text!;
        
        //Trennzeichen der Daten für die anzulegende Datei ist: ##$%
        var tempUserString = "";
        tempUserString =  "\(registrationUser.username)##$%\(registrationUser.name)##$%\(registrationUser.surname)##$%\(registrationUser.password)##$%\(registrationUser.city)##$%\(registrationUser.birthDay)##$%\(registrationUser.birthMonth)##$%\(registrationUser.birthYear)##$%\(registrationUser.description)##$%\(registrationUser.food)##$%\(registrationUser.hobbies)##$%\(registrationUser.height)\n";
        
        tools.writeToFile("user", tempUserString: tempUserString)
        
    }
    
}