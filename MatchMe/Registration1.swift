//
//  Registration1.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 01.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
import UIKit

class Registration1: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var registerUser: User!;
    var date = NSDate()
    var passwordOk: Bool! = false;
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var usernametxtf: UITextField!
    @IBOutlet weak var nametxtf: UITextField!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var surnametxtf: UITextField!
    @IBOutlet weak var passwordtxtf: UITextField!
    @IBOutlet weak var password2txtf: UITextField!
    @IBOutlet weak var citytxtf: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    @IBOutlet weak var scrollviewerReg1: UIScrollView!
    @IBOutlet weak var continueBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewTapped:")
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        scrollviewerReg1.addGestureRecognizer(tapRecognizer)
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
 
        if(registerUser != nil){
            addUserInformation();
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "continueRegistration"){
            let svc = segue.destinationViewController as! Registration2;
            svc.setRegistrationUsersInfo(registerUser);
        }
    }
    
    func addUserInformation(){
        usernametxtf.text = "\(registerUser.username)";
        nametxtf.text = "\(registerUser.name)";
        surnametxtf.text = "\(registerUser.surname)";
        passwordtxtf.text = "\(registerUser.password)";
        password2txtf.text = "\(registerUser.password)";
        citytxtf.text = "\(registerUser.city)";
        
        let dateString = "\(registerUser.birthYear)-\(registerUser.birthMonth)-\(registerUser.birthDay)"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        date = dateFormatter.dateFromString(dateString)!
        birthdatePicker.date =  date;
        continueBtn.enabled = true;
    }
    
    func setRegistrationUsersInfo(user: User){
        registerUser = user;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if(textField == citytxtf || textField == passwordtxtf || textField == password2txtf){
            scrollviewerReg1.setContentOffset(CGPointMake(0,100), animated: true)
        }
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.view.endEditing(true)
        scrollviewerReg1.setContentOffset(CGPointMake(0,0), animated: true)
        
        if(textField == password2txtf){
            if(passwordtxtf.text != password2txtf.text){
                password2txtf.layer.borderWidth = 2.0;
                password2txtf.layer.borderColor = UIColor.redColor().CGColor
                passwordOk = false;
            }
            else{
                password2txtf.layer.borderWidth = 0;
                password2txtf.layer.borderColor = UIColor.grayColor().CGColor;
                passwordOk = true;
                
            }
        }
        
        enableContinueBtnIfCompleted();
    }
    
    func enableContinueBtnIfCompleted(){
        if(usernametxtf.text != "" && nametxtf.text !=  "" && surnametxtf.text != "" && passwordOk == true && citytxtf.text != ""){
            
            continueBtn.enabled = true;
        }
        else{
            continueBtn.enabled = false;
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false;
    }
    
    func scrollViewTapped(recognizer: UITapGestureRecognizer){
        self.view.endEditing(true)
        
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        self.date = birthdatePicker.date
    }
    
    
    @IBAction func changePicture(sender: AnyObject){
        
        
        let photoAlert = UIAlertController(title: "Foto hochladen", message: "", preferredStyle: .ActionSheet)
        
        //Foto mit der Kamera aufnehmen
        photoAlert.addAction(UIAlertAction(title: "Foto aufnehmen", style: .Default, handler: { (action: UIAlertAction!) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
                self.imagePicker.delegate = self
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
                
            }
        }))
        
        //Foto aus der Galerie auswählen
        photoAlert.addAction(UIAlertAction(title: "Aus Galerie auswhählen", style: .Default, handler: { (action: UIAlertAction!) in
            
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
                self.imagePicker.delegate = self
                self.imagePicker.allowsEditing = false
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
                
                print("Button Gallery")}
        }))
        //Abbrechen
        photoAlert.addAction(UIAlertAction(title: "Abbrechen", style: .Default, handler: nil))
        
        self.presentViewController(photoAlert, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        pictureView.contentMode = .ScaleAspectFit
        pictureView.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func continueRegistration(sender: UIButton) {
        if(registerUser == nil){
            
            registerUser = User();
            registerUser.username = usernametxtf.text!;
            registerUser.name = nametxtf.text!;
            registerUser.surname = surnametxtf.text!;
            registerUser.password = passwordtxtf.text!;
            registerUser.city = citytxtf.text!;
            
            let strDateTime = String(date)
            let strDate = strDateTime.characters.split{$0 == " "}.map(String.init)
            let strDateArr = strDate[0].characters.split{$0 == "-"}.map(String.init)
            
            registerUser.birthDay = Int(strDateArr[2])!;
            registerUser.birthMonth = Int(strDateArr[1])!;
            registerUser.birthYear = Int(strDateArr[0])!;
            
        }
    }
}
