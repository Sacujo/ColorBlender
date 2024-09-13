//
//  UIColor + ext.swift
//  ColorBlender
//
//  Created by Igor Guryan on 13.09.2024.
//

import UIKit

extension UIColor {
    static func blendColors(_ colors: UIColor...) -> UIColor {
        var reds = Array(repeating: CGFloat(0), count: colors.count)
        var greens = Array(repeating: CGFloat(0), count: colors.count)
        var blues = Array(repeating: CGFloat(0), count: colors.count)
        var a = Array(repeating: CGFloat(0), count: colors.count)
        
        var count = 0
        
        colors.forEach {
            $0.getRed(
                &reds[count],
                green: &greens[count],
                blue: &blues[count],
                alpha: &a[count]
            )
            count += 1
        }
        
        let blendedColor = UIColor(
            red: reds.reduce(0, +) / CGFloat(colors.count),
            green: greens.reduce(0, +) / CGFloat(colors.count),
            blue: blues.reduce(0, +) / CGFloat(colors.count),
            alpha: a.reduce(0, +) / CGFloat(colors.count)
        )
        
        return blendedColor
    }
    
    var redValue: CGFloat{
        return cgColor.components! [0]
    }
    
    var greenValue: CGFloat{
        return cgColor.components! [1]
    }
    
    var blueValue: CGFloat{
        return cgColor.components! [2]
    }
}
