//
//  LanguageManager.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/25.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

func LocalizedString(_ key: String) -> String {
    return LanguageManager.localizeStringWith(key)
}

class LanguageManager: NSObject {
    
    static func localizeStringWith(_ key: String) -> String {
        let source = (LanguageManager.currentLanguage() == "cn") ? "cn" : "tw"
        let fileName = Bundle.main.path(forResource: source, ofType: "strings")
        
        if let fileName = fileName, let dic = NSDictionary(contentsOfFile: fileName), let result = dic.object(forKey: key) as? String  {
            return result
        }
        return ""
    }
    
    static func currentLanguage() -> String {
        let languageCode = NSLocale.current.languageCode
        let scriptCode = NSLocale.current.scriptCode
        
        if languageCode == "zh" {
            if scriptCode == "Hans" {
                return "cn"
            } else {
                return "zh"
            }
        }
        return "en"
    }
}
