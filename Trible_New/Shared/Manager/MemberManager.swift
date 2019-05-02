//
//  MemberManager.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/11.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class MemberManager {
    
    /// [MEM_A_001] Get Member Details
    static func apiGetMemberDetails(success: @escaping (_ response: BaseModel<String>?) -> Void,
                                    failure: @escaping failureClosure) {
        
        APIManager.sendGetRequestWith(parameters: nil, path: ApiUrl.Member.getMemberDetails, success: { (response) in
            
        }, failure: failure)
    }
    
    /// [MEM_A_002] Get Member Item Value
    ///
    /// - Parameters:
    ///   - type: 使用者資料類別
    static func apiGetMemberItemValue<T: Codable>(type: MemberItemValueType,
                                                  success: @escaping (_ response: BaseModel<T>?) -> Void,
                                                  failure: @escaping failureClosure) {
        APIManager.sendGetRequestWith(parameters: nil, path: ApiUrl.Member.getMemberItemValue + "/\(type)", success: { (response) in
            let result = APIManager.decode(response: response, type: BaseModel<T>.self)
            success(result)
        }, failure: failure)
    }
    
    /// [MEM_A_003] Get Member Setting
    static func apiGetMemberSetting(success: @escaping (_ response: BaseModel<MemberSettingModel>?) -> Void,
                                    failure: @escaping failureClosure) {
        APIManager.sendGetRequestWith(parameters: nil, path: ApiUrl.Member.getMemberSetting, success: { (response) in
            let result = APIManager.decode(response: response, type: BaseModel<MemberSettingModel>.self)
            success(result)
        }, failure: failure)
    }
    
    /// [MEM_A_004] Get Member Receipt Account List
    static func apiGetMemberReceiptAccountList(success: @escaping (_ response: BaseModel<[MemberReceiptAccountModel]>?) -> Void,
                                               failure: @escaping failureClosure) {
        APIManager.sendGetRequestWith(parameters: nil, path: ApiUrl.Member.getGetMemberReceiptAccountList, success: { (response) in
            let result = APIManager.decode(response: response, type: BaseModel<[MemberReceiptAccountModel]>.self)
            success(result)
        }, failure: failure)
    }
}
