//
//  RunnerSelectorRouter.swift
//  D2Runner
//
//  Created by Simka on 22.02.2023.
//

import UIKit

final class RunnerSelectorCoordinator {
    private lazy var presenter: RunnerSelectorPresenter = {
        return RunnerSelectorPresenter()
    }()
    
    var controller: UIViewController {
        let presenter = self.presenter
        let vc = RunnerSelectorViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
