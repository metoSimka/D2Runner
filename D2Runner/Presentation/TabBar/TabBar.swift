//
//  TabBar.swift
//  D2Runner
//
//  Created by Simka on 22.02.2023.
//

import UIKit

final class TabBar: UITabBar {
    private enum Constants {
        static let backgroundColor: UIColor = .D2Color.n1
    }

    private let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    override public init(frame _: CGRect) {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        sendSubviewToBack(visualEffectView)
    }

    // MARK: - Private

    private func setup() {
        backgroundColor = .D2Color.n1
        visualEffectView.frame = bounds
        addSubview(visualEffectView)
    }
}
