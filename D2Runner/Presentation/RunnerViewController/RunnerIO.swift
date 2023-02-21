//
//  File.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import Foundation

protocol IRunnerViewInput: AnyObject {
    func updateDestinaionLabel(_ text: String)
}

protocol IRunnerViewOutput: AnyObject {
    func onViewDidLoad()
}
