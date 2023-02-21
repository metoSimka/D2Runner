//
//  RunnerViewPresenter.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import Foundation

final class RunnerViewPresenter {
    
    weak var view: IRunnerViewInput?
}

extension RunnerViewPresenter: IRunnerViewOutput {
    
    func onViewDidLoad() {
        view?.updateDestinaionLabel("Current run")
    }
}
