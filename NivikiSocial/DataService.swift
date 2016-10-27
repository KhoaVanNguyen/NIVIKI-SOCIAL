//
//  DataService.swift
//  NivikiSocial
//
//  Created by Khoa on 10/27/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

let DB_BASE = FIRDatabase.database().reference()
class DataService{
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_POSTS = DB_BASE.child("posts")
    
    var REF_BASE : FIRDatabaseReference{
        return _REF_BASE
    }
    
    var REF_USERS : FIRDatabaseReference{
        return _REF_USERS
    }
    
    var REF_POSTS : FIRDatabaseReference{
        return _REF_POSTS
    }
    
    func createFirebaseUser(uid : String, userData : Dictionary<String,Any>){
        
        _REF_USERS.child(uid).setValue(userData)
    }
    
    
}




















