//
//  UIProgressView+Extension.swift
//  UAEProLeague
//
//  Created by Mobiiworld on 08/05/20.
//  Copyright © 2020 Mobiiworld. All rights reserved.
//

import UIKit

@IBDesignable extension UIProgressView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.sublayers![1].cornerRadius
        }
        set {
            layer.sublayers![1].cornerRadius = newValue
            self.subviews[1].clipsToBounds = true
        }
    }
}
