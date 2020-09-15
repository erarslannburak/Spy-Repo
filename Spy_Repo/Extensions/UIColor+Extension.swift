//
//  UIColor+Extension.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 15.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var cString : String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")){
            let index = cString.index(cString.startIndex, offsetBy: 1)
            cString = String(cString[index...])
        }
        let scanner = Scanner(string: cString)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    
    
    public class var calculatorOrangeColor:UIColor {
        return UIColor.init(hex: "FF9500")
    }
    
    public class var calculatorDarkGreyColor:UIColor {
        return UIColor.init(hex: "333333")
    }
    
    public class var calculatorLightGreyColor:UIColor {
        return UIColor.init(hex: "AFAFAF")
    }
}
