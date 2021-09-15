//
//  ViewUtils.swift
//  UAEProLeague
//
//  Created by Mazen on 4/24/20.
//  Copyright © 2020 Mobiiworld. All rights reserved.
//

import UIKit

struct ViewUtils {
//    static func datePickerToolBar() -> (UIToolbar, UIButton,UIButton)
//    {
//        let toolBar = UIToolbar()
//           toolBar.tintColor = UIColor.AppColor.primary
//           toolBar.backgroundColor = UIColor.AppColor.primary
//           toolBar.barTintColor = UIColor.AppColor.primary
//           let doneButton = AppButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
//           doneButton.fontStyle = ControlConfig.FontStyleSlug.regular.rawValue
//           doneButton.setTitleColor(UIColor.AppColor.text, for: .normal)
//        doneButton.setTitle("Done".localizedString, for: .normal)
////           doneButton.addTarget(self, action: #selector(doneButtonPressed(sender:)), for: .touchUpInside)
//           let doneBarButton = UIBarButtonItem(customView: doneButton)
//           
//           let cancelButton = AppButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
//           cancelButton.fontStyle = ControlConfig.FontStyleSlug.regular.rawValue
//        cancelButton.setTitle("Cancel".localizedString, for: .normal)
//           cancelButton.setTitleColor(UIColor.AppColor.text, for: .normal)
////           cancelButton.addTarget(self, action: #selector(cancelButtonPressed(sender:)), for: .touchUpInside)
//           let cancelBarButton = UIBarButtonItem(customView: cancelButton)
//           
//           
//           let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//           toolBar.setItems([cancelBarButton, spaceButton, doneBarButton], animated: false)
//           toolBar.sizeToFit()
//           
//           return (toolBar,doneButton,cancelButton)
//    }
    static func righBarButtonItem(title:String,target:Any?,action:Selector?) -> UIBarButtonItem
    {
        let button = UIBarButtonItem(title: title, style: .plain, target: target, action: action)
               button.setTitleTextAttributes([
                   NSAttributedString.Key.font : UIFont(name: UIFont.AppFont.regular, size: 16)!,
                   NSAttributedString.Key.foregroundColor : UIColor.AppColor.white],
                                             for: .normal)
        return button
    }
}
