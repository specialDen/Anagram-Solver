//
//  UIViewExtensions.swift
//  Anagram Solver
//
//  Created by Izuchukwu Dennis on 09.02.2023.
//

import UIKit

extension UIButton {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRectMake(0, 0, self.frame.size.width, width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRectMake(self.frame.size.width - width, self.frame.size.height*0.15, width, self.frame.size.height*0.7)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRectMake(0, self.frame.size.height*0.15, width, self.frame.size.height*0.7)
        self.layer.addSublayer(border)
    }
}
