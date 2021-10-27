//
//  APIHelper.swift

//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

final class APIHelper {
    
//    static func login(withEmail:String, password:String, failure:@escaping APICompletionBlock,success:@escaping (_ user:User) -> Void ){
//        
//        let params: Parameters = ["email":withEmail, "password":password, "type":"email"]
//        
//        BaseAPIManager.shared.request(method: .post, url: APIEndPoint.login.rawValue, parameters: params, failure: failure) { (response) in
//            print(response)
//            if let json = response.response.data.arrayValue.first {
//                let user = User.init(json: json)
//                success(user)
//            }
//        }
//    }
//    
//    static func register(withFirstName:String, lName:String, email:String, password:String, PhoneCode:String, mobile:String, google_id: String,apple_id:String, failure:@escaping APICompletionBlock,success:@escaping (_ user:User) -> Void ){
//        
//        let params: Parameters = ["first_name": withFirstName, "last_name":lName, "phone_code":PhoneCode, "phone_number":mobile, "email":email, "password":password, "type":"email", "deviceId":"", "device_type":"ios","google_id": google_id,"apple_id": apple_id]
//        
//        BaseAPIManager.shared.request(method: .post, url: APIEndPoint.register.rawValue, parameters: params, failure: failure) { (response) in
//            print(response)
//            if let json = response.response.data.arrayValue.first {
//                let user = User.init(json: json)
//                success(user)
//            }
//        }
//    }
//    
//    static func getCountryList(failure:@escaping APICompletionBlock,success:@escaping (_ countries:[Country]) -> Void ){
//        
//        BaseAPIManager.shared.request(method: .get, url: APIEndPoint.countryList.rawValue, parameters: [:], failure: failure) { (response) in
//            print(response)
//            let countries = response.response.data.arrayValue.map({Country(json: $0)})
//            success(countries)
//        }
//    }
//    
}
