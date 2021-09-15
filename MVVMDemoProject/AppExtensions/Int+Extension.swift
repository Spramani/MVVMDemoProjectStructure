//
//  Int+Extension.swift
//  ASAQ
//
//  Created by mobiiworld on 09/09/19.
//

import Foundation

extension Int {
    
    func localizedString() -> String {
        let formatter: NumberFormatter = NumberFormatter()
        let identifier = PersistanceUtil.isLanguageArabic() ?  "AR" : "EN"
        formatter.locale = Locale(identifier: identifier)
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
extension Double {
    func localizedString() -> String {
        let formatter: NumberFormatter = NumberFormatter()
        let identifier = PersistanceUtil.isLanguageArabic() ? "AR" : "EN"
        formatter.locale = Locale(identifier: identifier)
        formatter.minimumFractionDigits = 1
        return formatter.string(from: NSNumber(value:self)) ?? "\(self)"
    }
}
