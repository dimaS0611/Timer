//
//  TimerModel+Extension.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 14.07.21.
//

import Foundation

extension TimerModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(duration)
        hasher.combine(isTimerRunning)
    }
}
