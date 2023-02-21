//
//  D2LabelStyle.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//


extension D2Label.Style {
    static var boldText: D2Label.Style {
        .init(textColor: .D2Color.n0,
              font: .D2Font.bold(size: 20))
    }
    
    static var title: D2Label.Style {
        .init(textColor: .D2Color.n0,
              font: .D2Font.regular(size: 17))
    }
    
    static var regularText: D2Label.Style {
        .init(textColor: .D2Color.n0,
              font: .D2Font.regular(size: 15))
    }
    
    static var description: D2Label.Style {
        .init(textColor: .D2Color.n0,
              font: .D2Font.regular(size: 14))
    }
}
