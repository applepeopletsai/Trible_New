//
//  APIManager.swift
//  Trible_New
//
//  Created by Daniel on 2019/1/23.
//  Copyright © 2019年 Daniel. All rights reserved.
//

import Foundation
import Alamofire

typealias successClosure = (_ response: DataResponse<Any>) -> Void
typealias failureClosure = (_ error: Error?) -> Void

struct BaseModel<T: Codable>: Codable {
    var HttpStatusCode: Int
    var Result: T?
}

struct ApiUrl {
    private struct Domain {
        static let DEV = "http://triblewebapi.azurewebsites.net/api/"
        static let UAT = ""
        static var current: String {
            #if DEV
            return Domain.DEV
            #else
            return Domain.UAT
            #endif
        }
    }
    
    struct Authentication {
        /// [AUT_W_001] Get API Token
        static var getToken: String { return Domain.current + "Authentication/Token/App" }
    }
    
    struct Member {
        /// [MEM_A_001] Get Member Details
        static var getMemberDetails: String { return Domain.current + "Members/Member" }
        /// [MEM_A_002] Get Member Item Value
        static var getMemberItemValue: String { return Domain.current + "Members/Member/Info" }
        /// [MEM_A_003] Get Member Setting
        static var getMemberSetting: String { return Domain.current + "Members/Member/Setting" }
        /// [MEM_A_004] Get Member Receipt Account List
        static var getGetMemberReceiptAccountList: String { return Domain.current + "Members/Member/Receipts" }
    }
    
    struct Explore {
        /// [EXP_A_001] Get Explore Info List
        static var getExploreInfoList: String { return Domain.current + "Explores/Explore/InfoList/Member" }
    }
}

class APIManager: NSObject {
    private struct APIRequestModel: Equatable {
        var type: HTTPMethod
        var parameters: Parameters?
        var path: String
        var success: successClosure?
        var failure: failureClosure?
        
        static func == (lhs: APIManager.APIRequestModel, rhs: APIManager.APIRequestModel) -> Bool {
            return lhs.path == rhs.path
        }
    }
    
    static private var AFManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    static func headers() -> HTTPHeaders {
        return ["Content-Type":"application/json",
                "Authorization":"Bearer \(UserManager.getUserToken())",
                "X-Device-Type":"App"]
    }
    
    static private var requestArray = [APIRequestModel]()
    
    // GET
    static func sendGetRequestWith(parameters: Parameters?, path: String, success: successClosure?, failure: failureClosure?) {
        sendRequest(type: .get, parameters: parameters, path: path, success: success, failure: failure)
    }
    
    // POST
    static func sendPostRequestWith(parameters: Parameters?, path: String, success: successClosure?, failure: failureClosure?) {
        sendRequest(type: .post, parameters: parameters, path: path, success: success, failure: failure)
    }
    
    static private func sendRequest(type: HTTPMethod, parameters: Parameters?, path: String, success: successClosure?, failure: failureClosure?) {
        debugPrint("API Path: \(path)")
        debugPrint("Parameters: \(String(describing: parameters))")
        DispatchQueue.global().async {
            let model = APIRequestModel(type: type, parameters: parameters, path: path, success: success, failure: failure)
            addRequestModelArray(model: model)
            // error code: -999 : https://github.com/Alamofire/Alamofire/issues/1684
            AFManager.request(path, method: type, parameters: parameters, encoding: JSONEncoding.default, headers: APIManager.headers()).responseJSON(completionHandler: { (response) in
                debugPrint(response)
                if response.result.isSuccess {
                    DispatchQueue.main.async {
                        success?(response)
                        removeRequestModelArray(model: model)
                    }
                } else {
                    if response.error?._code == NSURLErrorTimedOut {
                        DispatchQueue.main.async {
                            SystemManager.showTimeOutErrorAlert(tryAgainHandler: {
                                for model in requestArray {
                                    sendRequest(type: model.type, parameters: model.parameters, path: model.path, success: model.success, failure: model.failure)
                                }
                            })
                        }
                    } else {
                        DispatchQueue.main.async {
                            failure?(response.error)
                            removeRequestModelArray(model: model)
                        }
                    }
                }
            })
        }
    }
    
    // Decode
    static func decode<T: Codable>(response: DataResponse<Any>, type: T.Type) -> T? {
        if let data = response.data {
            do {
                let result = try JSONDecoder().decode(type, from: data)
                return result
            } catch DecodingError.keyNotFound(let key, let context) {
                debugPrint("KeyNotFound, key: \(key)")
                debugPrint("CodingPath: \(context.codingPath)")
                debugPrint("Debug description: \(context.debugDescription)")
                return nil
            } catch DecodingError.typeMismatch(let type, let context) {
                debugPrint("TypeMismatch, type: \(type)")
                debugPrint("CodingPath: \(context.codingPath)")
                debugPrint("Debug description: \(context.debugDescription)")
                return nil
            } catch DecodingError.dataCorrupted(let context) {
                debugPrint("DataCorrupted")
                debugPrint("CodingPath: \(context.codingPath)")
                debugPrint("Debug description: \(context.debugDescription)")
                return nil
            } catch DecodingError.valueNotFound(let type, let context) {
                debugPrint("ValueNotFound, type: \(type)")
                debugPrint("CodingPath: \(context.codingPath)")
                debugPrint("Debug description: \(context.debugDescription)")
                return nil
            } catch {
                debugPrint("Decoder Error: \(error.localizedDescription)")
                return nil
            }
        } else {
            debugPrint("Unknown Error")
            return nil
        }
    }
    
    static private func addRequestModelArray(model: APIRequestModel) {
        DispatchQueue.main.async {
            if !requestArray.contains(model) {
                requestArray.append(model)
            }
        }
    }
    
    static private func removeRequestModelArray(model: APIRequestModel) {
        DispatchQueue.main.async {
            if let index = requestArray.firstIndex(of: model) {
                requestArray.remove(at: index)
            }
        }
    }
}
