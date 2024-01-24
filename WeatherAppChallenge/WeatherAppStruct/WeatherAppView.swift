//
//  CardView.swift
//  WeatherAppChallenge
//
//  Created by Jonathan de Jesus Avila on 23/01/24.
//

import Foundation
import UIKit

class WeatherCardView: UIView {
    let temperatureCard = CardView()
    let windSpeedCard = CardView()
    let lastUpdatedCard = CardView()
    let Header = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardViews()
        layoutCardViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCardViews() {
        Header.text = "Weather"
        Header.font = UIFont.boldSystemFont(ofSize: 24)
        
        addSubview(Header)
        addSubview(temperatureCard)
        addSubview(windSpeedCard)
        addSubview(lastUpdatedCard)
        layoutCardViews()
    }
    
    func updateWithWeather(weather: Weather) {
        temperatureCard.titleLabel.text = "Temperature"
        temperatureCard.valueLabel.text = "\(weather.temperature)°C"
        
        windSpeedCard.titleLabel.text = "Wind Speed"
        windSpeedCard.valueLabel.text = "\(weather.windspeed) km/h"
        
        lastUpdatedCard.titleLabel.text = "Last Updated"
        lastUpdatedCard.valueLabel.text = weather.time
    }
    
    private func layoutCardViews() {
        Header.translatesAutoresizingMaskIntoConstraints = false
        temperatureCard.translatesAutoresizingMaskIntoConstraints = false
        windSpeedCard.translatesAutoresizingMaskIntoConstraints = false
        lastUpdatedCard.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            Header.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            Header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            Header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            temperatureCard.topAnchor.constraint(equalTo: Header.bottomAnchor, constant: 40),
            temperatureCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            temperatureCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            windSpeedCard.topAnchor.constraint(equalTo: temperatureCard.bottomAnchor, constant: 20),
            windSpeedCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            windSpeedCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lastUpdatedCard.topAnchor.constraint(equalTo: windSpeedCard.bottomAnchor, constant: 20),
            lastUpdatedCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lastUpdatedCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
