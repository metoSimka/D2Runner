//
//  RunnerInfoRowView.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit
import SnapKit

final class RunnerInfoRowView: UIView {
    
    private let titleView = D2Label(style: .title)
    private let valueView = D2Label(style: .boldText)
    
    init(titleRow: String, valueRow: String = "0") {
        super.init(frame: .zero)
        self.titleView.text = titleRow
        self.valueView.text = valueRow
        let stackView = UIStackView()
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(valueView)
        
        titleView.textAlignment = .left
        valueView.textAlignment = .left
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateValueView(_ text: String) {
        valueView.text = text
    }
    
    func updateValueView<T>(_ value: T) {
        valueView.text = "\(value)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
