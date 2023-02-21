//
//  TabBarViewController.swift
//  D2Runner
//
//  Created by Simka on 22.02.2023.
//

import UIKit

class TabBarController: UITabBarController {
    var customTabBar: TabBar!
    var onItemSelected: ((Int) -> Void)?

    // MARK: - View's lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customTabBar = TabBar(frame: tabBar.frame)
        customTabBar.delegate = self
        setValue(customTabBar, forKey: "tabBar")
    }

    // MARK: - Overriden

    override func tabBar(_: UITabBar, didSelect item: UITabBarItem) {
        if let onItemSelected = self.onItemSelected {
            if let index = tabBar.items?.firstIndex(of: item) {
                onItemSelected(index)
            }
        }

        guard let navigationTitle = (item as? TabBarItem)?.tab?.navigationTitle else {
            title = item.title
            return
        }
        title = navigationTitle
    }
}
