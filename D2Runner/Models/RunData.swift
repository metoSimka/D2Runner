//
//  RunData.swift
//  D2Runner
//
//  Created by Simka on 21.02.2023.
//

import UIKit

struct RunData {
    
    init(runList: [TimeInterval] = []) {
        self.runList = runList
    }
    
    private(set) var runList: [TimeInterval]
    
    var count: Int {
        runList.count
    }
    
    var averageTime: TimeInterval {
        let sum = runList.reduce(0, +)
        return roundValue(sum/Double(count))
    }
    
    var fastestTime: TimeInterval {
        guard let min = runList.min() else {
            return 0
        }
        return roundValue(min)
    }
    
    private func roundValue(_ value: TimeInterval) -> Double {
        Double(round(10 * value) / 10)
    }
    
    mutating func appendRun(timeInterval: TimeInterval) {
        runList.append(timeInterval)
    }
}
