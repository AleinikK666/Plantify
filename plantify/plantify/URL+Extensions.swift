import Foundation

extension URL {
    
    static func urlForWeatherFor(_ city: String) -> URL? {
        var real = String()
        if (city == "San Francisco"){
            real = "San%20Francisco"
        }
        else{
            real = city
        }
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(real)&appid=3407e56b90cdbcda588f7bb801a35709") else {
            return nil
        }
        
        return url
        
    }
    
}
