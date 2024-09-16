import XCTest
import MyLibrary

final class WeatherServiceTests: XCTestCase {
    
    func testweatherSeriveTest_SuccessCase() async throws {
        // Given
        let returnedVal = 38
        let localPath = "https://weather-api-mock-samishakhurana.vercel.app"
        let weatherSerivce = WeatherServiceImpl(baseUrl: localPath)
        
        // When
        let temperature = try await weatherSerivce.getTemperature()
        print("debugging temperature ", temperature)
        
        // Then
        XCTAssertNotNil(temperature)
        XCTAssertEqual(temperature, Int(returnedVal))
    }
}
