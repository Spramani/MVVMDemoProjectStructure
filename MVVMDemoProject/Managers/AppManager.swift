//
//  AppManager.swift

//

import Foundation
import Reachability
import SwiftyJSON
import CoreLocation

class AppManager {
    var reachability:Reachability?
    var currentLocation:CLLocationCoordinate2D?

    static let shared = AppManager()
    var isGuestUser: Bool = false
    var isLightModeSelected = false
 //   var currentUser: user = .guest

     func logOut(){
        isGuestUser = false
    }
    
    private init()
    {
    }
    var basicConfig: JSON? {
        if let json = PersistanceUtil.savedBasicConfigJSON() {
            return json
        }
        if let json =  AppManager.basicConfigJSON() {
            return json
        }
        return nil
    }
    
    private static func basicConfigJSON() -> JSON? {
         if let url = Bundle.main.url(forResource: "BasicConfig", withExtension: "json") {
             do {
                 let data = try Data(contentsOf: url, options: .mappedIfSafe)
                 let json = try JSON(data: data)
                 return json
                 
             } catch {
                 // handle error
             }
         }
         return nil
     }
    
//    static func countries() -> [Country] {
//        return AppManager.shared.basicConfig?.data["country"].arrayValue.map{Country.init(json: $0)} ?? [Country]()
//
//    }
    
//    var user:User? {
//        didSet {
//            if let savedUser = user
//            {
//                PersistanceUtil.saveUserJSONResponse(savedUser.parsedJSON)
//
//                if let json = savedUser.parsedJSON, let token = json["access_token"].string, token.isValid {
//                    self.token = token
//                    print("token :: ", token)
//                }
//            }
//            else {
//                PersistanceUtil.saveUserJSONResponse(nil)
//                self.token = ""
//            }
//            NotificationCenter.default.post(name: Notification.Name.userDataUpdated, object: self, userInfo: nil)
//        }
//    }
//
    var token:String = ""
    {
        didSet
        {
                PersistanceUtil.saveAccessToken(token)
            NotificationCenter.default.post(name: Notification.Name.userTokenDataUpdated, object: self, userInfo: nil)

        }

    }

    var experience:Int?
       {
           didSet {
                   PersistanceUtil.saveExperienceValue(experience)

           }

       }
    
    func hasNetwork() -> Bool {
        guard let connection = reachability?.connection else {
            return false
        }
        guard  connection != .unavailable else {
            return false
        }
        return true
    }
    
}
