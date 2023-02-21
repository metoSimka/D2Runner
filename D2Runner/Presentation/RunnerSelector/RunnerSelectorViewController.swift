//
//  RunnerSelectorViewController.swift
//  D2Runner
//
//  Created by Simka on 22.02.2023.
//

import UIKit
import SnapKit

final class RunnerSelectorViewController: UIViewController {
    let presenter: IRunnerSelectorOutput
    
    init(presenter: IRunnerSelectorOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RunnerSelectorViewController: IRunnerSelectorInput {
    
}
