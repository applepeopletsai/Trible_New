//
//  ExploreManager.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class ExploreManager {
    
    /// [MEM_A_001] Get Member Details
    static func apiGetExploreInfoList(success: @escaping (_ response: BaseModel<[ExploreInfoModel]>?) -> Void,
                                      failure: @escaping failureClosure) {
        
        APIManager.sendGetRequestWith(parameters: nil, path: ApiUrl.Explore.getExploreInfoList, success: { (response) in
            
        }, failure: failure)
    }
}
