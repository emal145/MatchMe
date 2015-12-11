//
//  NeuesSpiel.swift
//  MatchMe
//
//  Created by Emel Altmisoglu on 09.12.15.
//  Copyright © 2015 Emel Altmisoglu. All rights reserved.
//

import Foundation
import UIKit

class NeuesSpiel: UIViewController{
    
   
    @IBOutlet var slider: UISlider!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var umkreisLbl: UILabel!
    @IBOutlet var openMenu: UIBarButtonItem!
    @IBOutlet var womanBtn: UIButton!
    @IBOutlet var btnMan: UIButton!
    var umkreis:Int = 300;
    var chooseMen = false;
    var chooseWoman = false;
    var tools = Tools()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenu.target =  self.revealViewController()
        openMenu.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    @IBAction func setGender(sender: UIButton) {
        let checkedColor = UIColor.init(colorLiteralRed: 0.56, green: 0.93, blue: 0.56, alpha: 0.3)
        
        let transparentColor = UIColor.init(colorLiteralRed: 0.56, green: 0.93, blue: 0.56, alpha: 0.0)
        
        if(sender.tag == 0){
            chooseMen = !chooseMen;
            
            if(chooseMen){
                btnMan.layer.backgroundColor = checkedColor.CGColor;
            }
            else{
                btnMan.layer.backgroundColor = transparentColor.CGColor
            }
            
        }
        else{
            chooseWoman = !chooseWoman;
            if(chooseWoman){
                womanBtn.layer.backgroundColor = checkedColor.CGColor;
            }
            else{
                womanBtn.layer.backgroundColor = transparentColor.CGColor
            }
            
        }
        
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        umkreis = Int(sender.value)
        umkreisLbl.text = "\(umkreis) km"
    }

    @IBAction func continueGame(sender: AnyObject) {
        tools.writeToFile("newGame", tempUserString: "\(chooseWoman)##$%\(chooseMen)##$%\(umkreis)")
        
    }
}