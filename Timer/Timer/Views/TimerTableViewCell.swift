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
    
    private let timerName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    var time = 0
    
    var timer: TimerModel? {
        didSet {
            timerName.text = timer?.name
            time = timer?.duration ?? 0
            timer?.isTimerRunning = true
            
            updateTime()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(timerValueLabel)
        addSubview(timerName)
        
        timerName.translatesAutoresizingMaskIntoConstraints = false
        timerName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timerName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
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
            time -= 1
            
            if time >= 0 {
                let hours = time / 3600
                let minutes = time / 60 % 60
                let seconds = time % 60
                
                var times: [String] = []
                if hours > 0 {
                    times.append("\(hours)")
                }
                if minutes > 0 {
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
