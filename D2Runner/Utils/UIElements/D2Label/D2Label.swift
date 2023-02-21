//
//  D2Label.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

class D2Label: UILabel {
    struct Style {
        let textColor: UIColor
        let font: UIFont
    }
    
    var style: Style
    
    init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        apply(style: style)
    }
  
    func apply(style: Style) {
        font = style.font
        textColor = style.textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
