//
//  ViewController.swift
//  NivikiSocial
//
//  Created by Khoa on 9/7/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func fbLogin(_ sender: Any) {
        
        
    let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { error, result in
            if error != nil{
                print("FB login error")
                print("\(error)")
            }
            else if error?.isCancelled == true{
                print("user canceld login")
            }
            else {

                let credential = FBSDKAccessToken.current().tokenString
                print("\(credential)")
            
            }
            
        }

    }
}

