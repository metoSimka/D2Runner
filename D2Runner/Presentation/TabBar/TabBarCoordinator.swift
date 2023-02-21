//
//  TabBarCoordinator.swift
//  D2Runner
//
//  Created by Simka on 22.02.2023.
//

import UIKit

final class TabBarCoordinator {
    
    var controller: UIViewController {
        rootViewController
    }
    
    private var rootViewController: TabBarController {
        let tabBarViewController = TabBarController()
        let runnerViewController = RunnerCoordinator().controller
        runnerViewController.tabBarItem.title = R.string.localizable.tab_run()
        
        let runnerSelectorViewController = RunnerSelectorCoordinator().controller
        runnerSelectorViewController.tabBarItem.title = R.string.localizable.tab_select()
        let controllers = [
            runnerViewController,
            runnerSelectorViewController
        ]
        tabBarViewController.setViewControllers(controllers, animated: false)
        tabBarViewController.selectedIndex = Tab.select.rawValue
        tabBarViewController.title = Tab.select.title
        return tabBarViewController
    }
    
    private func open(tab: Tab) {
        self.rootViewController.selectedIndex = tab.rawValue
    }
}
