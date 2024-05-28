import Alamofire

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

public class WeatherServiceImpl: WeatherService {
    private let baseUrl: String
    private let path = "/data/2.5/weather"
    
    public init(baseUrl: String = "https://api.openweathermap.org") {
        self.baseUrl = baseUrl
    }
    

    public func getTemperature() async throws -> Int {
        let completeURL = (baseUrl + path)
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(completeURL, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                case let .success(weather):
                    let temperature = weather.main.temp
                    let temperatureAsInteger = Int(temperature)
                    continuation.resume(with: .success(temperatureAsInteger))

                case let .failure(error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

public struct Weather: Decodable {
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}
