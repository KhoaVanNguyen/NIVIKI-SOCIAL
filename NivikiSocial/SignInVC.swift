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

    
    @IBOutlet weak var emailTF : UITextField!
    @IBOutlet weak var passwordTF : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
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

                let token = FBSDKAccessToken.current().tokenString
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: token!)
                self.firebaseLogin(credential: credential)
            }
        }
    }
 
    
    
    @IBAction func emailLogin(_ sender: Any) {
        if let email = emailTF.text, email != "" , let pwd = passwordTF.text , pwd != ""{
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (FIRUser, error) in
                if error != nil{
                    print( (error as! NSError).code == STATUS_USER_NONEXIST)
                    self.showAlert(title: "User not found", msg: "This user wasn't created")
                
                FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    
                    print("Create user successfully")
                    
                })
                    
                }
                // Success
                else {
                    print("Login success")
                   
                }
            })
            
        }
        else {
            self.showAlert(title: "Error", msg: "Please type in email or password")
        }
    }
    
    
    // MARK: Function
    func showAlert(title : String, msg:  String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    func firebaseLogin(credential : FIRAuthCredential)
    {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil{
                print("Firebase login error")
            }else{
                print("Login successfully")
            }
        })
    }
}







