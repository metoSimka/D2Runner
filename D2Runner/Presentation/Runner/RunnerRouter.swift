//
//  RunnerCoordinator.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

final class RunnerCoordinator {
    private lazy var presenter: RunnerPresenter = {
        return RunnerPresenter()
    }()
    
    private var rootController: RunnerViewController {
        let presenter = self.presenter
        let vc = RunnerViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
    
    var controller: UIViewController {
        return rootController
    }
}
