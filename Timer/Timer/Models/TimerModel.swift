//
//  Timer.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import Foundation

class TimerModel {
    
    var name: String
    var duration: Int = 0
    var isTimerRunning = false
    
    init(name: String, duration: Int) {
        self.name = name
        self.duration = duration
    }
}
  
