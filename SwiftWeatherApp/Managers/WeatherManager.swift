//
//  WeatherManager.swift
//  SwiftWeatherApp
//
//  Created by Andres C G on 5/16/24.
//

import Foundation
import CoreLocation

enum WeatherError: Error, LocalizedError {
    case missingEnvVariable(String)
    case invalidURL
    case networkError(Error)
    case unexpectedResponse
    case dataParsingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .missingEnvVariable(let variable):
            return "Missing environment variable: \(variable)"
        case .invalidURL:
            return "Invalid URL."
        case .networkError(let error):
            return "Network error occurred: \(error.localizedDescription)"
        case .unexpectedResponse:
            return "Unexpected response from the server."
        case .dataParsingError(let error):
            return "Error parsing data: \(error.localizedDescription)"
        }
    }
}

class WeatherManager {
    let env = ProcessInfo.processInfo.environment
    var apiKey: String
    
    init() throws {
        let envDict = Bundle.main.infoDictionary?["LSEnvironment"] as! Dictionary<String, String>

        // ENV guide: https://stackoverflow.com/questions/14214741/xcode-environment-variables-not-present-during-archive
        // and https://vikramios.medium.com/mastering-environment-variables-in-swift-84b27d6ec7aa
        guard let apiKey = envDict["WEATHER_API_KEY"] else {
            throw WeatherError.missingEnvVariable("WEATHER_API_KEY")
        }
        self.apiKey = apiKey
    }
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else {
            throw WeatherError.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw WeatherError.unexpectedResponse
            }
            
            do {
                let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
                return decodedData
            } catch {
                throw WeatherError.dataParsingError(error)
            }
        } catch {
            throw WeatherError.networkError(error)
        }
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
