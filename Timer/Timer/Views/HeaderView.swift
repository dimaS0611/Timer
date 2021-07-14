//
//  HeaderView.swift
//  Timer
//
//  Created by Dzmitry Semenovich on 13.07.21.
//

import UIKit

class HeaderView: UIView {
    
    var title: String
    
    init(frame: CGRect, title: String) {
        self.title = title
        super.init(frame: frame)
        
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader() {
        let headerTitle = UILabel()
        
        headerTitle.textAlignment = .left
        headerTitle.text = title
        headerTitle.font = UIFont.systemFont(ofSize: 14)
        headerTitle.textColor = .systemGray2
        self.addSubview(headerTitle)
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: 47.0, width: bounds.width, height: 0.5)
        bottomBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        self.layer.addSublayer(bottomBorder)
        
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
}
