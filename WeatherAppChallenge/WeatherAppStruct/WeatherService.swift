//
//  WeatherService.swift
//  WeatherAppChallenge
//
//  Created by Jonathan de Jesus Avila on 23/01/24.
//

import Foundation
import Combine

import Foundation

class WeatherService {
    static let shared = WeatherService()
    
    private init() {}
    
    func fetchWeather(latitude: Double, longitude: Double) async throws -> WeatherResponse {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current_weather=true"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse
    }
}

