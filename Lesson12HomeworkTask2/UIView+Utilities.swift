//
//  UIView+Utilities.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 24.02.22.
//

import Foundation
import UIKit

extension UIView {
    func applyCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor,UIColor.blue.cgColor]
        gradient.cornerRadius = 30
        self.layer.insertSublayer(gradient, at: 0)
        
    }
}
