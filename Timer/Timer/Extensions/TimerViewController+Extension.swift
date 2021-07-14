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

// MARK: - Adding timer
extension TimerViewController {
    
    @objc func addTimer() {
        createTimer()
        
        let name = timerNameTextField.text ?? "Timer"
        
        if name == "" {
            showAlertWith(title: "Failed to add new timer", message: "Timer's name cannot be empty")
            return
        }
        
        if let duration = Int(timerDurationTextField.text ?? "0") {
            DispatchQueue.main.async {
                let timer = TimerModel(name: name, duration: duration)
                
                self.timers.append(timer)
                
                self.timers.sort(by: { $0.duration > $1.duration })
                
                let indexPath = IndexPath(row: self.timers.count - 1, section: 0)
                
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [indexPath], with: .top)
                self.tableView.endUpdates()
            }
        } else {
            showAlertWith(title: "Failed to add new timer", message: "Timer's duration is incorrect")
        }
    }
}

// MARK: - Timer
extension TimerViewController {
    
    func createTimer() {
        if timer == nil {
            let timer = Timer(timeInterval: 0.1,
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
                
                var deleteIndexPath: [IndexPath] = []
                if (cell.timer?.duration ?? 1) <= 0 {
                    let rowIdx = self.timers.firstIndex(where: { $0 == cell.timer && !$0.isTimerRunning })
                    self.timers.remove(at: rowIdx ?? 0)
                    deleteIndexPath.append(IndexPath(row: rowIdx ?? 0, section: 0))
                    
                    self.tableView.beginUpdates()
                    self.tableView.deleteRows(at: deleteIndexPath, with: .right)
                    self.tableView.endUpdates()
                }
            }
        }
        
    }
}

//MARK: -TextFieldDelegate
extension TimerViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 20
        let currentString = (textField.text ?? "") as NSString
        let newString =
                currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}

// MARK: -Alert
extension TimerViewController {
    
    func showAlertWith(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
}


