//
//  ViewController.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var addTimerView: UIView!
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Timer"
        safeArea = view.layoutMarginsGuide
        
        addTimerView = UIView()
        addTimerView.backgroundColor = .systemBackground
        view.addSubview(addTimerView)
        
        let header = HeaderView(frame: CGRect(x: 0, y: 10, width: view.bounds.width, height: 20), title: "Добавление таймеров")
        addTimerView.addSubview(header)
        
        let timerNameTextField = UITextField()
        timerNameTextField.placeholder = "Название таймера"
        timerNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        addTimerView.addSubview(timerNameTextField)
        
        let timerDurationTextField = UITextField()
        timerDurationTextField.placeholder = "Время в секундах"
        timerDurationTextField.borderStyle = UITextField.BorderStyle.roundedRect
        addTimerView.addSubview(timerDurationTextField)
        
        let addButton = UIButton(type: UIButton.ButtonType.roundedRect)
        addButton.backgroundColor = UIColor.systemGray6
        addButton.layer.cornerRadius = 10
        addButton.setTitle("Добавить", for: UIControl.State.normal)
        addTimerView.addSubview(addButton)

        addTimerView.translatesAutoresizingMaskIntoConstraints = false
        addTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addTimerView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        addTimerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        addTimerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        header.translatesAutoresizingMaskIntoConstraints = false
        header.widthAnchor.constraint(equalTo: addTimerView.widthAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 45).isActive = true
        header.topAnchor.constraint(equalTo: addTimerView.topAnchor).isActive = true
        
        //layout name of timer textField in addingTimerView
        timerNameTextField.translatesAutoresizingMaskIntoConstraints = false
        timerNameTextField.widthAnchor.constraint(equalTo: addTimerView.widthAnchor, multiplier: 0.6).isActive = true
        timerNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timerNameTextField.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        timerNameTextField.leadingAnchor.constraint(equalTo: addTimerView.leadingAnchor, constant: 20).isActive = true
        
        //layout duration of timer textField in addingTimerView
        timerDurationTextField.translatesAutoresizingMaskIntoConstraints = false
        timerDurationTextField.widthAnchor.constraint(equalTo: addTimerView.widthAnchor, multiplier: 0.6).isActive = true
        timerDurationTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timerDurationTextField.topAnchor.constraint(equalTo: timerNameTextField.bottomAnchor, constant: 20).isActive = true
        timerDurationTextField.leadingAnchor.constraint(equalTo: addTimerView.leadingAnchor, constant: 20).isActive = true
        
        //layout addButton in addingTimerView
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalTo: addTimerView.widthAnchor, multiplier: 0.9).isActive = true
        addButton.centerXAnchor.constraint(equalTo: addTimerView.centerXAnchor).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        addButton.topAnchor.constraint(equalTo: timerDurationTextField.bottomAnchor, constant: 35).isActive = true
        
      //  setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
}

