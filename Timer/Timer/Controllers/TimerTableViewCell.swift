//
//  TimerTableViewCell.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import UIKit

class TimerTableViewCell: UITableViewCell {
    
    private let timerValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    private let timerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    var timer: TimerModel? {
        didSet {
            timerNameLabel.text = timer?.name
            timer?.isTimerRunning = true
            
            updateTime()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(timerValueLabel)
        addSubview(timerNameLabel)
        
        // layout of timer name label
        timerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        timerNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timerNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        // layout of timer value label
        timerValueLabel.translatesAutoresizingMaskIntoConstraints = false
        timerValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timerValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateState() {
        guard let timer = timer else {
            return
        }
        timer.isTimerRunning.toggle()
        
        updateTime()
    }
    
    func updateTime() {
        guard let timer = timer else {
            return
        }
        
        if timer.isTimerRunning {
            timer.duration -= 1
            
            let time = timer.duration
            
            if time >= 0 {
                let hours = time / 3600
                let minutes = time / 60 % 60
                let seconds = time % 60
                
                var times: [String] = []
                
                if hours < 10 {
                    times.append("0\(hours)")
                } else {
                    times.append("\(hours)")
                }
                
                if minutes < 10 {
                    times.append("0\(minutes)")
                } else {
                    times.append("\(minutes)")
                }
                
                times.append("\(seconds)")
                
                timerValueLabel.text = times.joined(separator: " : ")
            } else {
                timerValueLabel.text = "Completed"
            }
        } else {
            timerValueLabel.text = "Paused"
        }
    }
}
