//
//  RunnerCoordinator.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

final class RunnerRouter {
    private lazy var presenter: RunnerViewPresenter = {
        return RunnerViewPresenter()
    }()
    
    func controller() -> UIViewController {
        let presenter = self.presenter
        let vc = RunnerViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
