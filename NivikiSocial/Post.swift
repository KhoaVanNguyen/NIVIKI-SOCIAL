//
//  Post.swift
//  NivikiSocial
//
//  Created by Khoa on 10/27/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation

class Post {
    
    private var _postDescription : String!
    private var _like : Int!
    private var _imageUrl : String?
    private var _username : String!
    
    private var _postKey : String

    
    var postDescription : String{
        return _postDescription
    }
    var like : Int{
        return _like
    }
    var username : String{
        return _username
    }
    var postKey : String{
        return _postKey
    }
    var imageUrl : String?{
        return _imageUrl
    }
    
    init(postKey : String, dictionary : Dictionary<String, Any>) {
        self._postKey = postKey
        
        if let desc = dictionary["description"] as? String{
            self._postDescription = desc
        }
        if let like = dictionary["like"] as? Int{
            self._like = like
        }
        
        if let imgUrl = dictionary["imgUrl"] as? String{
            self._imageUrl = imgUrl
        }
    }
    
}
















