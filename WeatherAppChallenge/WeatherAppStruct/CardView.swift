//
//  CardView.swift
//  WeatherAppChallenge
//
//  Created by Jonathan de Jesus Avila on 23/01/24.
//

import Foundation
import UIKit

class CardView: UIView {
    let titleLabel = UILabel()
    let valueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardView()
        setupLabels()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCardView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
    }
    
    private func setupLabels() {
        [titleLabel, valueLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        titleLabel.textColor = .lightGray
    }
    
    private func layoutViews() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            valueLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: -40)
        ])
    }
    
}

