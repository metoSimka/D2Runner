//
//  D2ButtonStyle.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

extension D2Button.Style {
    struct medium {
        static var black: D2Button.Style {
            .init(height: 56,
                  color: .D2Color.n0,
                  cornerRadius: 12,
                  font: .D2Font.regular(size: 15))
        }
    }
}
