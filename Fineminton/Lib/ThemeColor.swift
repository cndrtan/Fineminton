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
    
    public init(_ currentColorScheme: ColorScheme) {
        self.currentColorScheme = currentColorScheme
    }
    
    public var buttonColor: Color {
        get {
            if(self.currentColorScheme == ColorScheme.dark) {
                self._buttonColor = Color.orange
            }
            else {
                self._buttonColor = Color.blue
            }
            return self._buttonColor
        }
    }
}
