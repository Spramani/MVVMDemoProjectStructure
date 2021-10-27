//
//  CRNotificationType.swift
//  CRNotifications

//

import Foundation
import UIKit

/// Enum for types of notifications
public enum CRNotificationType {
    case success
    case error
    case info
    case alert
    
    var color: UIColor {
        switch self {
        case .success: return UIColor.AppColor.primary
        case .error: return UIColor.AppColor.accent
        case .info: return UIColor.AppColor.primary
        case .alert: return UIColor.AppColor.white
        }
    }
    var titleColor: UIColor {
        switch self {
        case .success: return UIColor.AppColor.white
        case .error: return UIColor.AppColor.white
        case .info: return UIColor.AppColor.white
        case .alert: return UIColor.AppColor.primary
        }
    }
    var messageColor: UIColor {
        switch self {
        case .success: return UIColor.AppColor.white
        case .error: return UIColor.AppColor.white
        case .info: return UIColor.AppColor.white
        case .alert: return UIColor.AppColor.primary
        }
    }
    var image: UIImage {
        
        switch self {
        case .success: return UIImage(named: "message_tick_green") ?? UIImage()
        case .error: return UIImage(named: "message_warning_white") ?? UIImage()
        case .info: return UIImage(named: "message_warning_orange") ?? UIImage()
        case .alert: return UIImage(named: "group") ?? UIImage()
        }
    }
}
