//
//  ExploreModels.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/29.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct ExploreInfoModel: Codable {
    var Id: String
    var MemberId: String?
    var Name: String
    var Participants: Int
    var ExploreTime: Int
    var Cost: Int
    var Country: String
    var City: String
    var MeetLocation: String
    var FrontCover: String
    var CreateTime: String
    var EditTime: String
    var TribleAllow: Bool
    var Draft: Bool
    var Return: Bool
    var EstimationScore: String
    var EstimationCount: Int
}
