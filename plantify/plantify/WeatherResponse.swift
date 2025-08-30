//
//  WeatherResponce.swift
//  plantity
//
//  Created by Екатерина Алейник on 18.05.25.
//
import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
