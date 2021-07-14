//
//  TimerViewController.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import UIKit

class TimerViewController: UIViewController {
    
    var addTimerView: UIView!
    var timersTableView: UIView!
    
    let timerNameTextField = UITextField()
    let timerDurationTextField = UITextField()
    
    let tableView = UITableView()
    
    var safeArea: UILayoutGuide!
    
    var timers: [TimerModel] = []
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Мульти таймер"
        safeArea = view.layoutMarginsGuide
        
        self.tableView.register(TimerTableViewCell.self, forCellReuseIdentifier: "TimerCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        setupAddingTimerView()
        
        setupTableView()
    }
    
    func setupAddingTimerView() {
        addTimerView = UIView()
        addTimerView.backgroundColor = .systemBackground
        view.addSubview(addTimerView)
        
        let header = HeaderView(frame: CGRect(x: 0, y: 10, width: view.bounds.width, height: 20), title: "Добавление таймеров")
        addTimerView.addSubview(header)
        
        timerNameTextField.placeholder = "Название таймера"
        timerNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        addTimerView.addSubview(timerNameTextField)
        
        timerDurationTextField.placeholder = "Время в секундах"
        timerDurationTextField.borderStyle = UITextField.BorderStyle.roundedRect
        addTimerView.addSubview(timerDurationTextField)
        
        let addButton = UIButton(type: UIButton.ButtonType.roundedRect)
        addButton.backgroundColor = UIColor.systemGray6
        addButton.layer.cornerRadius = 10
        addButton.setTitle("Добавить", for: UIControl.State.normal)
        addButton.addTarget(self, action: #selector(addTimer), for: .touchUpInside)
        addTimerView.addSubview(addButton)
        
        // layout of addingTimerView
        addTimerView.translatesAutoresizingMaskIntoConstraints = false
        addTimerView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        addTimerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        addTimerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        // layout of header in addingTimerView
        header.translatesAutoresizingMaskIntoConstraints = false
        header.widthAnchor.constraint(equalTo: addTimerView.widthAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 45).isActive = true
        header.topAnchor.constraint(equalTo: addTimerView.topAnchor).isActive = true
        
        // layout of timer's textField in addingTimerView
        timerNameTextField.translatesAutoresizingMaskIntoConstraints = false
        timerNameTextField.widthAnchor.constraint(equalTo: addTimerView.widthAnchor, multiplier: 0.6).isActive = true
        timerNameTextField.heightAnchor.constraint(lessThanOrEqualTo: addTimerView.heightAnchor, multiplier: 0.15).isActive = true
        timerNameTextField.topAnchor.constraint(lessThanOrEqualTo: header.bottomAnchor, constant: 20).isActive = true
        timerNameTextField.leadingAnchor.constraint(equalTo: addTimerView.leadingAnchor, constant: 20).isActive = true
        
        // layout of timer's duration textField in addingTimerView
        timerDurationTextField.translatesAutoresizingMaskIntoConstraints = false
        timerDurationTextField.widthAnchor.constraint(equalTo: addTimerView.widthAnchor, multiplier: 0.6).isActive = true
        timerDurationTextField.heightAnchor.constraint(lessThanOrEqualTo: addTimerView.heightAnchor, multiplier: 0.15).isActive = true
        timerDurationTextField.topAnchor.constraint(lessThanOrEqualTo: timerNameTextField.bottomAnchor, constant: 20).isActive = true
        timerDurationTextField.leadingAnchor.constraint(equalTo: addTimerView.leadingAnchor, constant: 20).isActive = true
        
        // layout of addButton in addingTimerView
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalTo: addTimerView.widthAnchor, multiplier: 0.9).isActive = true
        addButton.centerXAnchor.constraint(equalTo: addTimerView.centerXAnchor).isActive = true
        addButton.heightAnchor.constraint(greaterThanOrEqualTo: addTimerView.heightAnchor, multiplier: 0.2).isActive = true
        addButton.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: timerDurationTextField.bottomAnchor, multiplier: 2.5).isActive = true
    }
    
    func setupTableView() {
        timersTableView = UIView()
        timersTableView.backgroundColor = .systemBackground
        view.addSubview(timersTableView)
        
        let header = HeaderView(frame: CGRect(x: 0, y: 10, width: view.bounds.width, height: 20), title: "Таймеры")
        timersTableView.addSubview(header)
        
        timersTableView.addSubview(tableView)
        
        // layout of timersTableView
        timersTableView.translatesAutoresizingMaskIntoConstraints = false
        timersTableView.topAnchor.constraint(equalTo: addTimerView.bottomAnchor, constant: 20).isActive = true
        timersTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        timersTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        // layout of header in timersTableView
        header.translatesAutoresizingMaskIntoConstraints = false
        header.widthAnchor.constraint(equalTo: timersTableView.widthAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 45).isActive = true
        header.topAnchor.constraint(equalTo: timersTableView.topAnchor).isActive = true
        
        // layout of tableView in timersTableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: timersTableView.bottomAnchor).isActive = true
    }
    
}

