//
//  APIClient.swift
//  WeatherApp
//
//  Created by Casandra Grullon on 10/25/21.
//

import Foundation

struct APIClient {
    static func getWeather(lat: Double, long: Double, completion: @escaping (Result<Weather, Error>) -> ()) {
        let endpoint = "https://api.darksky.net/forecast/\(Secrets.darkSkyKey)/\(lat),\(long)"
        
        guard let url = URL(string: endpoint) else { return }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let results = try JSONDecoder().decode(Weather.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        dataTask.resume()
    }
}


