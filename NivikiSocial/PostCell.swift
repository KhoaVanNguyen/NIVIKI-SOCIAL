//
//  PostCell.swift
//  NivikiSocial
//
//  Created by Khoa on 10/27/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

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

    func configureCell( post : Post  ){
        self.post = post
        
        likeLbl.text = "\(self.post.like)"
        captionTF.text = post.postDescription
    }

}
