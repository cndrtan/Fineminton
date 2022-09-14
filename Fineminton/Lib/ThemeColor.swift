//
//  ColorScheme.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 07/09/22.
//

import Foundation
import SwiftUI

public class ThemeColor {
    
    private var currentColorScheme: ColorScheme
    private var _buttonColor: Color = Color.blue
    private var _primaryBackgroundColor: Color = Color.white
    
    public init(_ currentColorScheme: ColorScheme) {
        self.currentColorScheme = currentColorScheme
    }

    private static func colorFromHex(_ hex: String) -> Color {
        var str = hex
        if str.hasPrefix("#") {
            str.removeFirst()
        }
        if str.count == 3 {
            str = String(repeating: str[str.startIndex], count: 2)
            + String(repeating: str[str.index(str.startIndex, offsetBy: 1)], count: 2)
            + String(repeating: str[str.index(str.startIndex, offsetBy: 2)], count: 2)
        } else if !str.count.isMultiple(of: 2) || str.count > 8 {
            return Color.white
        }
        let scanner = Scanner(string: str)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        if str.count == 2 {
            let gray = Double(Int(color) & 0xFF) / 255
            return Color(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
        } else if str.count == 4 {
            let gray = Double(Int(color >> 8) & 0x00FF) / 255
            let alpha = Double(Int(color) & 0x00FF) / 255
            return Color(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
        } else if str.count == 6 {
            let red = Double(Int(color >> 16) & 0x0000FF) / 255
            let green = Double(Int(color >> 8) & 0x0000FF) / 255
            let blue = Double(Int(color) & 0x0000FF) / 255
            return Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
        } else if str.count == 8 {
            let red = Double(Int(color >> 24) & 0x000000FF) / 255
            let green = Double(Int(color >> 16) & 0x000000FF) / 255
            let blue = Double(Int(color >> 8) & 0x000000FF) / 255
            let alpha = Double(Int(color) & 0x000000FF) / 255
            return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
        } else {
            return Color.white
        }
    }
    
    public var buttonColor: Color {
        get {
            if(self.currentColorScheme == ColorScheme.dark) {
                self._buttonColor = ThemeColor.colorFromHex("EF6817")
            }
            else {
                self._buttonColor = Color.blue
            }
            return self._buttonColor
        }
    }
    
    public var primaryBackgroundColor: Color {
        get {
            if(self.currentColorScheme == ColorScheme.dark) {
                self._primaryBackgroundColor = Color(red: 0.11, green: 0.11, blue: 0.118);
            }
            else {
                self._primaryBackgroundColor = Color.white
            }
            return self._primaryBackgroundColor
        }
    }
}
