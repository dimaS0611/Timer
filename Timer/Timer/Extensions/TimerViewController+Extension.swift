//
//  TimerViewController+Extension.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import Foundation
import UIKit

// MARK: - UITableViewDelegate
extension TimerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TimerTableViewCell else {
            return
        }
        
        cell.updateState()
    }
}

// MARK: - UITableViewDataSource
extension TimerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimerCell", for: indexPath)
        
        if let cell = cell as? TimerTableViewCell {
            cell.timer = timers[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - Actions
extension TimerViewController {
    @objc func addTimer() {
        createTimer()
        
        let name = timerNameTextField.text ?? "Timer"
        if let duration = Int(timerDurationTextField.text ?? "0") {
            
            DispatchQueue.main.async {
                let timer = TimerModel(name: name, duration: duration)
                
                self.timers.append(timer)
                
                let indexPath = IndexPath(row: self.timers.count - 1, section: 0)
                
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [indexPath], with: .top)
                self.tableView.endUpdates()
            }
        } else {
            let alertController = UIAlertController(title: "Failed to add new timer", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
    }
}

// MARK: - Timer
extension TimerViewController {
    func createTimer() {
        if timer == nil {
            let timer = Timer(timeInterval: 1.0,
                              target: self,
                              selector: #selector(updateTimer),
                              userInfo: nil,
                              repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            
            self.timer = timer
        }
    }
    
    @objc func updateTimer() {
        guard let visibleRowsIndexPaths = tableView.indexPathsForVisibleRows else {
            return
        }
        
        for indexPath in visibleRowsIndexPaths {
            if let cell = tableView.cellForRow(at: indexPath) as? TimerTableViewCell {
                cell.updateTime()
            }
        }
        
        deleteTimerIfNeeded()
    }
}

extension TimerViewController {
    func deleteTimerIfNeeded() {
        for i in 0..<timers.count {
            if (timers[safe: i]?.duration ?? 1) <= 0 {
                timers.remove(at: i)
                let indexPath = IndexPath(item: i, section: 0)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}


