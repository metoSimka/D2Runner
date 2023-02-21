//
//  Tab.swift
//  D2Runner
//
//  Created by Simka on 22.02.2023.
//

import UIKit

enum Tab: Int {
    case runner = 0
    case select = 1
    case settings = 2

    var title: String {
        switch self {
        case .runner:
            return R.string.localizable.tab_run()
        case .select:
            return R.string.localizable.tab_select()
        case .settings:
            return R.string.localizable.tab_settings()
        }
    }

    var navigationTitle: String {
        switch self {
        case .runner:
            return R.string.localizable.tab_run()
        case .select:
            return R.string.localizable.tab_select()
        case .settings:
            return R.string.localizable.tab_settings()
        }
    }
    
    var image: UIImage {
        return .init()
    }
}

final class TabBarItem: UITabBarItem {
    var tab: Tab?

    init(tab: Tab) {
        super.init()
        self.tab = tab
        self.title = tab.title
        self.image = tab.image
        self.selectedImage = tab.image
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
