//
//  CircleView.swift
//  NivikiSocial
//
//  Created by Khoa on 10/27/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
