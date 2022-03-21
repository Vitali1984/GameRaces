//
//  UIColor+hex.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 24.02.22.
//

import Foundation
import UIKit

extension UIColor {
   convenience init(hex: Int) {
       let red = (hex >> 16) & 0xFF
       let green = (hex >> 8) & 0xFF
       let blue = hex & 0xFF
       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }
}
