//
//  RoundedImage.swift
//  NivikiSocial
//
//  Created by Khoa on 9/7/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    override func awakeFromNib() {
        layer.cornerRadius = 10.0
    }
}
