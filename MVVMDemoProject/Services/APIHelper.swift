//
//  APIHelper.swift
//  Assima Mall
//
//  Created by Mobiiworld on 03/08/21.
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
//    static func getHomeList(failure:@escaping APICompletionBlock,success:@escaping (_ brands:[Brand], _ generalList:[GeneralList]) -> Void ){
//        
//        let params: Parameters = ["deviceId": "sgsgsjsktekc58fh7h52ymbd4f5",
//            "deviceType": "ios"]
//        
//        BaseAPIManager.shared.request(method: .get, url: APIEndPoint.userHome.rawValue, parameters: params, needUserToken: true, failure: failure) { (response) in
//            print(response)
//            let responseData = response.response.data
//            let brands = responseData["brands"].arrayValue.map({Brand(json: $0)})
//            let generalList = responseData["verticals"].arrayValue.map({GeneralList(json: $0)})
//            success(brands, generalList)
//        }
//    }
//    
//    static func getUserProfile(failure:@escaping APICompletionBlock,success:@escaping (_ countries:[User]) -> Void ){
//        
//        BaseAPIManager.shared.request(method: .get, url: APIEndPoint.userData.rawValue, needUserToken: true, failure: failure) { (response) in
//            print(response)
//            let userdata = response.response.data.arrayValue.map({User(json: $0)})
//            
//            success(userdata)
//        }
//    }
//    
}
