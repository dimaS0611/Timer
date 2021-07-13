//
//  AddingTimer.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import UIKit

class AddingTimer: UIView {
    
    var timerNameTextField = UITextField()
    var timerDurationTextField = UITextField()
    
    var addButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
       timerNameTextField.frame = CGRect(x: 10.0, y: 50.0, width: 150.0, height: 20.0)
        timerNameTextField.placeholder = "Название таймера"
      //  timerNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerNameTextField)
        
       timerDurationTextField.frame = CGRect(x: 10.0, y: 120.0, width: 150.0, height: 20.0)
        timerDurationTextField.placeholder = "Время в секундах"
       // timerDurationTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerDurationTextField)
        
        
   //    addButton.frame = CGRect(x: 10.0, y: 200.0, width: self.bounds.width - 10, height: 50)
        addButton.backgroundColor = .systemGray
        addButton.setTitle("Добавить", for: UIControl.State.normal)
        //addButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addButton)
        
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            //pin headerTitle to headerView
           // timerNameTextField.topAnchor.constraint(equalTo: self.topAnchor),
            timerNameTextField.leftAnchor.constraint(equalTo: self.leftAnchor),
            timerNameTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            timerDurationTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            timerDurationTextField.leftAnchor.constraint(equalTo: self.leftAnchor),
            timerDurationTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            //layout addButton in headerView
            addButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            addButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
         //   addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //pin headerView to top
      //      self.topAnchor.constraint(equalTo: topAnchor),
        //    self.widthAnchor.constraint(equalToConstant: bounds.width),
          //  self.heightAnchor.constraint(equalToConstant: bounds.height)
        ])
    }
    
    override class var requiresConstraintBasedLayout: Bool {
      return true
    }
    
    override var intrinsicContentSize: CGSize {
      //preferred content size, calculate it if some internal state changes
      return CGSize(width: 300, height: 300)
    }
}
