//
//  WeatherModel.swift
//  WeatherAppChallenge
//
//  Created by Jonathan de Jesus Avila on 23/01/24.
//

struct WeatherResponse: Codable {
    let current_weather: Weather
}

struct Weather: Codable {
    let temperature: Double
    let windspeed: Double
    let time: String
}

