//
//  UIView+Extensions.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

extension UIView {
    func setCornerRadius(_ value: CGFloat) {
        self.layer.cornerRadius = value
    }
}

extension UIView {
    func dropShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 12
    }
}
