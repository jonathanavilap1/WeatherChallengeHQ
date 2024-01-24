//
//  WeatherViewController.swift
//  WeatherAppChallenge
//
//  Created by Jonathan de Jesus Avila on 23/01/24.
//

import UIKit
import Combine

class WeatherViewController: UIViewController {
    private let weatherCardView = WeatherCardView()
    
    private var viewModel = WeatherViewModel()
    private var cancellables = Set<AnyCancellable>()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        setupActivityIndicator()
        Task {
            await fetchData()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        self.title = "Weather"
        view.addSubview(weatherCardView)
        weatherCardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            weatherCardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func bindViewModel() {
        viewModel.$weather
            .receive(on: RunLoop.main)
            .sink { [weak self] weather in
                self?.updateWeatherDisplay(weather: weather)
            }
            .store(in: &cancellables)
        
        viewModel.$isLoading
            .receive(on: RunLoop.main)
            .sink { [weak self] isLoading in
                self?.updateLoadingState(isLoading: isLoading)
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .receive(on: RunLoop.main)
            .sink { [weak self] errorMessage in
                self?.showError(message: errorMessage)
            }
            .store(in: &cancellables)
    }
    
    private func fetchData() async {
        await viewModel.fetchWeather(latitude: 52.52, longitude: 13.41)
    }
    
    private func updateWeatherDisplay(weather: Weather?) {
        guard let weather = weather else { return }
        
        weatherCardView.temperatureCard.titleLabel.text = "Temperature"
        weatherCardView.temperatureCard.valueLabel.text = "\(weather.temperature)°C"
        
        weatherCardView.windSpeedCard.titleLabel.text = "Wind Speed"
        weatherCardView.windSpeedCard.valueLabel.text = "\(weather.windspeed) km/h"
        
        weatherCardView.lastUpdatedCard.titleLabel.text = "Last Updated"
        weatherCardView.lastUpdatedCard.valueLabel.text = weather.time
    }
    
    
    private func updateLoadingState(isLoading: Bool) {
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    private func showError(message: String?) {
        if let message = message {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}

extension WeatherViewController {
    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
