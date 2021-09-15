//
//  UIFont+Extension.swift
//  rider
//
//  Created by b2c on 9/27/17.
//  Copyright © 2017 Akhil Jayaram. All rights reserved.
//

import UIKit
extension UIFont
{
  
    struct AppFont {

        static var regular: String {
            return Organizer.shared.appLanguage == .english ? "Lato-Regular" : "Lato-Regular"
        }

        static var bold: String {
          return Organizer.shared.appLanguage == .english ? "Lato-Bold" : "Lato-Bold"
        }

        static var boldItalic: String {
            return Organizer.shared.appLanguage == .english ? "Lato-BoldItalic" : "Lato-BoldItalic"
        }

        static var italic: String {
            return Organizer.shared.appLanguage == .english ? "Lato-Italic" : "Lato-Italic"
        }

        static var medium: String {
            return Organizer.shared.appLanguage == .english ? "Lato-Medium" : "Lato-Medium"
        }
        
        static var semiBold: String {
            return Organizer.shared.appLanguage == .english ? "Lato-SemiBold" : "Lato-SemiBold"
        }
        
        static var light: String {
            return Organizer.shared.appLanguage == .english ? "Lato-Light" : "Lato-Light"
        }
        
        static var extraBold: String {
            return Organizer.shared.appLanguage == .english ? "Lato-ExtraBold" : "Lato-ExtraBold"
        }
        
        static var extraLight: String {
            return Organizer.shared.appLanguage == .english ? "Lato-ExtraLight" : "Lato-ExtraLight"
        }
        
        static var semiBoldItalic: String {
            return Organizer.shared.appLanguage == .english ? "Lato-SemiBoldItalic" : "Lato-SemiBoldItalic"
        }
        
        static var lightItalic: String {
            return Organizer.shared.appLanguage == .english ? "Lato-LightItalic" : "Lato-LightItalic"
        }
    }
   
}
