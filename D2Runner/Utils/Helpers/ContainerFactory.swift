//
//  ContainerFactory.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit
import SnapKit

final class ContainerFactory {
    static func container(_ view: UIView,
                          useConstraints: Bool = true,
                          insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0 )) -> UIView {
        let container = UIView()
        container.addSubview(view)
        if useConstraints {
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(insets)
            }
        }
        return container
    }
}
