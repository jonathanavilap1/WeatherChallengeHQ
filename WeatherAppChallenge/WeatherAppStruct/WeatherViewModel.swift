//
//  WeatherViewModel.swift
//  WeatherAppChallenge
//
//  Created by Jonathan de Jesus Avila on 23/01/24.
//

import Foundation
import Combine

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchWeather(latitude: Double, longitude: Double) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let weatherResponse = try await WeatherService.shared.fetchWeather(latitude: latitude, longitude: longitude)
            self.weather = weatherResponse.current_weather
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
