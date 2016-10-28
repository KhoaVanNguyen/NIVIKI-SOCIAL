//
//  PostCell.swift
//  NivikiSocial
//
//  Created by Khoa on 10/27/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import Firebase
class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var captionTF: UITextView!
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var avatarImg: CircleView!
    
    var post : Post!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell( post : Post , img : UIImage? = nil ){
        self.post = post
        
        likeLbl.text = "\(self.post.like)"
        captionTF.text = post.postDescription
        
        if img != nil{
            self.postImg.image = img
        }else {
            // no image
            
            if let imgUrl = post.imageUrl {
            
            let imgRef = FIRStorage.storage().reference(forURL: imgUrl)
            
            imgRef.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error == nil{
                    // download
                    if let imgData = data {
                    if let downloadImg = UIImage(data: imgData){
                        self.postImg.image = downloadImg
                        
                        FeedVC.imageCache.setObject(downloadImg, forKey: NSString(string: post.imageUrl!))
                    }
                }
                }
                else {
                        print("can't download image from Firebase storage!")
                }
            })
            }
            else{
                self.postImg.isHidden = true
            }
            
            
            
        }
    }

}











