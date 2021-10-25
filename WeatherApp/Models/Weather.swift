//
//  Weather.swift
//  WeatherApp
//
//  Created by Casandra Grullon on 10/25/21.
//

import Foundation

struct Weather: Decodable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: CurrentWeather
    let hourly: HourlyWeather
    let alerts: [Alert]
}

struct CurrentWeather: Decodable {
    let time: Int
    let summary: String
    let icon: String
    let precipProbability: Int
    let temperature: Double
}

struct HourlyWeather: Decodable {
    let summary: String
    let icon: String
    let data: [WeatherData]
}

struct WeatherData: Decodable {
    let time: Int
    let summary: String
    let icon: String
    let precipProbability: Int
    let temperature: Double
}

struct Alert: Decodable {
    let title: String
    let regions: [String]
    let severity: String
    let description: String
    let uri: String
}
