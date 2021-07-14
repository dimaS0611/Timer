//
//  Timer.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import Foundation

class TimerModel: Equatable {

    var name: String
    var duration: Double = 0.0
    var isTimerRunning = false
    
    init(name: String, duration: Int) {
        self.name = name
        self.duration = Double(duration)
    }
    
    static func == (lhs: TimerModel, rhs: TimerModel) -> Bool {
        if lhs.hashValue == rhs.hashValue {
            return true
        } else {
            return false
        }
    }
}

