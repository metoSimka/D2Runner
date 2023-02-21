//
//  D2Button.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

class D2Button: UIButton {
    struct Style {
        let height: CGFloat
        let color: UIColor
        let cornerRadius: CGFloat
        let font: UIFont
    }
    
    var style: Style
    
    init(title: String, style: Style) {
        self.style = style
        super.init(frame: .zero)
        apply(title: title, style: style)
        dropShadow()
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = style.height
        return size
    }
    
    func apply(title: String = "", style: Style) {
        setTitle(title, for: .normal)
        backgroundColor = style.color
        layer.cornerRadius = style.cornerRadius
        titleLabel?.font = style.font
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
