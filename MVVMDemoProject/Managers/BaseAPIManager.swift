//
//  BaseAPIManager.swift
//  UAEProLeague
//
//  Created by Mobiiworld on 30/03/2020.
//  Copyright © 2020 Mobiiworld. All rights reserved.
//

import Foundation
import Alamofire
import Reachability
import SwiftyJSON

typealias APICompletionBlock = (_ respone:APIResponse) -> Void
//
struct APIResponse {
    var success = false
    var message = ""
    var response:JSON
    
    static func createAPIResponse(_ success:Bool,_ message:String = "", _ response:JSON = JSON.null) -> APIResponse {
        return APIResponse.init(success: success, message: message, response: response)
    }
    
    static func createSuccessAPIResponse(_ message:String = "",_ response:JSON = JSON.null) -> APIResponse {
        return APIResponse.init(success: true, message: message, response: response)
    }
    
    static func createFailureAPIResponse(_ message:String = "", _ response:JSON = JSON.null) -> APIResponse {
        return  APIResponse.init(success: false, message: message, response: response)
    }
}

class BaseAPIManager:SessionDelegate {
    
    static var shared = BaseAPIManager()
    var manager = Session.default
    

    
//    override init() {
//        super.init()
//        manager = SessionManager.init(configuration: URLSessionConfiguration.ephemeral, delegate: self)
//    }
//
//    override func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        // Call into TrustKit here to do pinning validation
//        if TrustKit.sharedInstance().pinningValidator.handle(challenge, completionHandler: completionHandler) == false {
//            // TrustKit did not handle this challenge: perhaps it was not for server trust
//            // or the domain was not pinned. Fall back to the default behavior
//            completionHandler(.cancelAuthenticationChallenge, nil)
//        }
//    }
      
    private func getCertificates() -> [SecCertificate] {
        guard let url = Bundle.main.url(forResource: "agl", withExtension: "cer") else {
            return []
        }
        guard let localCertificate = try? Data(contentsOf: url) as CFData else { return [] }
        guard let certificate = SecCertificateCreateWithData(nil, localCertificate)
            else { return [] }
        return [certificate]
    }
    
//    private func enableCertificatePinning() {
//        let certificates = getCertificates()
//        let trustPolicy = ServerTrustPolicy.pinCertificates(
//            certificates: certificates,
//            validateCertificateChain: true,
//            validateHost: true)
//        let trustPolicies = [ APIContants.apiDomain: trustPolicy ]
//
//        let policyManager =  ServerTrustPolicyManager(policies: trustPolicies)
//        manager = SessionManager(
//            configuration: .default,
//            serverTrustPolicyManager: policyManager)
//    }
    
     func request (method : HTTPMethod, url:String!, parameters:Parameters = [:],pathComponent:String = "" ,isMwServer:Bool = false ,isAppleServer:Bool = false ,isTabbyAPI:Bool = false,needUserToken:Bool = false,failure:@escaping APICompletionBlock, success:@escaping APICompletionBlock) {
        
        let queue = DispatchQueue(label: "com.assimaMall-queue", qos: .utility, attributes: [.concurrent])
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60 // seconds
        configuration.timeoutIntervalForResource = 60
        
        var absoluteUrl = AppConfig.shared.apiEndpoint + url
        print(absoluteUrl)
        let apiToken = needUserToken ? (AppManager.shared.token.isEmpty ? APIContants.token : AppManager.shared.token) : APIContants.token
        
        let authorization = apiToken
        print("authorization:",apiToken)
        
        
        var param:Parameters? = parameters
        
        if method == .get {
            if let urlParameters = param {
                if !(urlParameters.isEmpty) {
                    absoluteUrl.append("?")
                    var array:[String] = []
                    let _ = urlParameters.map { (key, value) -> Bool in
                        let str = key + "=" +  String(describing: value)
                        array.append(str)
                        return true
                    }
                    absoluteUrl.append(array.joined(separator: "&"))
                }
            }
            param = nil
            
//            authorization = "Bearer \(apiToken)"
        }
        
        var language = String()
        if Organizer.shared.appLanguage == .arabic {
            language = "ar"
        } else {
            language = "en"
        }
        
//        let theme = Organizer.shared.appMode == .light ? "light" : "dark"
	        let headers: HTTPHeaders = [
            "authorization": authorization,
            "content-type": "application/json",
            "language": language,
        ]
        
        Logger.logRequestParams(key: "request", url:absoluteUrl, header:headers, value: parameters )
        let json = JSON.init(parameters as Any)
        Logger.logResponseParams(key: "requestP", value: json)
//        manager.sessionConfiguration.timeoutIntervalForResource = 60
//        manager.sessionConfiguration.timeoutIntervalForRequest = 60
        
        manager.request(absoluteUrl, method: method, parameters: param, encoding: JSONEncoding.default, headers:headers).responseJSON( queue: queue, options: .allowFragments,completionHandler: { response in
//            switch response.result{
//            case .success(let success):
//                print(success)
//            case .failure(let error):
//                let isServerTrustEvaluationError = error.isServerTrustEvaluationError
//            }
            if let status = response.response?.statusCode {
                switch(status) {
                case 200:
                    
                    let responseJSON = JSON(response.value ?? "")
                    print(responseJSON)
                    let statusCode = responseJSON["response_code"].intValue
                    let message = responseJSON["message"].stringValue
                    if  statusCode == APIContants.successCode
                    {
                        DispatchQueue.main.async {
                            success(APIResponse.createSuccessAPIResponse(message,responseJSON))
                        }
                    }
                    else if  statusCode == APIContants.errorCode
                    {
                        DispatchQueue.main.async {
                            failure(APIResponse.createFailureAPIResponse(message,responseJSON))
                        }
                    }
                    else if  statusCode == APIContants.unauthenticated
                    {
                        DispatchQueue.main.async {
                            failure(APIResponse.createFailureAPIResponse(message,responseJSON))
                        }
                    }
                    else if  statusCode == APIContants.tokenExpire
                    {
                        DispatchQueue.main.async {
                            failure(APIResponse.createFailureAPIResponse("Session Expired!".localizedString))
//                            AppDelegate.appdelegate.logout()
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async {
                            success(APIResponse.createSuccessAPIResponse(message,responseJSON))
                        }
                    }
                    
                case 401:
//                    let errorMsg = self.getFailureMessage(response: response)
//                    DispatchQueue.main.async {
//                        failure(APIResponse.createFailureAPIResponse("Session Expired!".localizedString))
//                    }
                    let errorMsg = self.getFailureMessage(response: response)
                    DispatchQueue.main.async {
                        failure(APIResponse.createFailureAPIResponse(errorMsg))
//                        AppDelegate.appdelegate.logout()
                    }
                    
                default:
                    let errorMsg = self.getFailureMessage(response: response)
                    DispatchQueue.main.async {
                        failure(APIResponse.createFailureAPIResponse(errorMsg))
                    }
                }
            }
            else {
                
                if response.error?.localizedDescription == "cancelled"{
                    DispatchQueue.main.async {
                        failure(APIResponse.createFailureAPIResponse(MessageConstant.sslPinningError.localizedString))
                    }
                    return
                }
                DispatchQueue.main.async {
                    failure(APIResponse.createFailureAPIResponse(MessageConstant.someError.localizedString))
                }
            }
        })
    }
    
    func getFailureMessage(response:AFDataResponse<Any>) -> String
    {
        var errorMsg = MessageConstant.someError.localizedString
        if let resultDictionary = response.value as? [String : Any] {
            if let message = resultDictionary["message"] as? String {
                errorMsg = message
            }
        }
        return errorMsg
    }
    
    
}

//struct Certificates {
//  static let stackExchange =
//    Certificates.certificate(filename: "uaepl_web")
//
//  private static func certificate(filename: String) -> SecCertificate {
//    let filePath = Bundle.main.path(forResource: filename, ofType: "der")!
//    let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
//    let certificate = SecCertificateCreateWithData(nil, data as CFData)!
//    return certificate
//  }
//}
extension Alamofire.Session{
    @discardableResult
    open func requestWithoutCache(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)// also you can add URLRequest.CachePolicy here as parameter
        -> DataRequest
    {
        do {
            var urlRequest = try URLRequest(url: url, method: method, headers: headers)
            urlRequest.cachePolicy = .reloadIgnoringCacheData // <<== Cache disabled
            let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
            return request(encodedURLRequest)
        } catch {
            // TODO: find a better way to handle error
            print(error)
            return request(URLRequest(url: URL(string: "http://example.com/wrong_request")!))
        }
    }
}
