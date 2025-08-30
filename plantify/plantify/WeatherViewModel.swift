//
//  WeatherViewModel.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//
import Foundation

enum LoadingState {
    case none
    case loading
    case success
    case failed
}

enum TemperatureUnit: String, CaseIterable {
    case fahrenheit
    case celsius
}

extension TemperatureUnit {
    
    var title: String {
        switch self {
            case .fahrenheit:
                return "Fahrenheit"
            case .celsius:
                return "Celsius"
        }
    }
    
}

class WeatherViewModel: ObservableObject {
    
    @Published private var weather: Weather?
    
    var temperature: Double {
        
        guard let temp = weather?.temp else {
            return 0.0
        }
        return temp - 273.15
        
    }
    
    func fetchWeather(city: String) -> Double{
        WeatherService().getWeather(city: city) {
            result in switch result {
            case .success(let weather):
                self.weather = weather
            case .failure(_ ):
                print("error")
            }
        }
        return WeatherService.temper
    }
}
