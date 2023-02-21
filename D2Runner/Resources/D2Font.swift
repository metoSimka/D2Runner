//
//  D2Font.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

extension UIFont {
    struct D2Font {
        static func regular(size: CGFloat) -> UIFont {
            return .systemFont(ofSize: size)
        }
        
        static func bold(size: CGFloat) -> UIFont {
            return .boldSystemFont(ofSize: size)
        }
    }
}
