//
//  SearchField.swift

//

import Foundation
import UIKit

class SearchField: AppField {

  
    
    override func commonInit() {
        super.commonInit()
      //  self.leftImage = UIImage.init(named: "searchMag")
        self.rightImage = UIImage.init(named: "searchIcon")
       // self.showExternalPlacholder = true
        //self.backgroundColor = UIColor.AppColor.clear
//        self.attributedPlaceholder = NSAttributedString(string:self.placeholderKey.localizedString, attributes:[NSAttributedString.Key.foregroundColor: UIColor.AppColor.darkGray])

    }
    override func updatePadding() {
        super.updatePadding()
        padding.top = 0
    }
    
}
