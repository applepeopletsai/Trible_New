//
//  ColorTool.swift
//  Trible_New
//
//  Created by Daniel on 2018/10/25.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

let color_C7C7CD = ColorTool.colorWith(hexString: "#C7C7CD", alpha: 1.0)
let color_1A1C69 = ColorTool.colorWith(hexString: "#1A1C69", alpha: 1.0)
let color_9B9B9B = ColorTool.colorWith(hexString: "#9B9B9B", alpha: 1.0)
let color_379D86 = ColorTool.colorWith(hexString: "#379D86", alpha: 1.0)
let color_F4F4F4 = ColorTool.colorWith(hexString: "#F4F4F4", alpha: 1.0)
let color_F2F2F2 = ColorTool.colorWith(hexString: "#F2F2F2", alpha: 1.0)
let color_31D0C1 = ColorTool.colorWith(hexString: "#31D0C1", alpha: 1.0)
let color_4A90E2 = ColorTool.colorWith(hexString: "#4A90E2", alpha: 1.0)
let color_000000_05 = ColorTool.colorWith(hexString: "#000000", alpha: 0.5)

class ColorTool {
    static func colorWith(hexString: String, alpha: CGFloat) -> UIColor {
        let colorString = hexString.replacingOccurrences(of: "#", with: "").uppercased()
        
        var red: CGFloat = 0, blue: CGFloat = 0, green: CGFloat = 0
        switch colorString.count {
        case 3: // #RGB
            red   = self.colorComponetFromWith(string: colorString, start: 0, length: 1)
            green = self.colorComponetFromWith(string: colorString, start: 1, length: 1)
            blue  = self.colorComponetFromWith(string: colorString, start: 2, length: 1)
            break
        case 4: // #ARGB
            red   = self.colorComponetFromWith(string: colorString, start: 1, length: 1)
            green = self.colorComponetFromWith(string: colorString, start: 2, length: 1)
            blue  = self.colorComponetFromWith(string: colorString, start: 3, length: 1)
            break
        case 6: // #RRGGBB
            red   = self.colorComponetFromWith(string: colorString, start: 0, length: 2)
            green = self.colorComponetFromWith(string: colorString, start: 2, length: 2)
            blue  = self.colorComponetFromWith(string: colorString, start: 4, length: 2)
            break
        case 8: // #AARRGGBB
            red   = self.colorComponetFromWith(string: colorString, start: 2, length: 2)
            green = self.colorComponetFromWith(string: colorString, start: 4, length: 2)
            blue  = self.colorComponetFromWith(string: colorString, start: 6, length: 2)
            break
        default:
            var error: NSError?
            error = nil
            NSException.raise(NSExceptionName(rawValue: "Invalid color value"), format: "Color value \(hexString) is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB. Error: %@", arguments: getVaList([error ?? "nil"]))
            break
        }
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private static func colorComponetFromWith(string: String, start: Int, length: Int) -> CGFloat {
        let range = string.index(string.startIndex, offsetBy: start)..<string.index(string.startIndex, offsetBy: start+length)
        let subString = String(string[range])
        let fullHex = length == 2 ? subString : "\(subString)\(subString)"
        let hexComponet = Int(fullHex, radix: 16)!
        return CGFloat(Float(hexComponet) / 255.0)
    }
    
    static func createImageWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let theImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
}
