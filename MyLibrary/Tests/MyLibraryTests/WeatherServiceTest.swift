import XCTest
import MyLibrary

final class WeatherServiceTests: XCTestCase {
    
    func testweatherSeriveTest_SuccessCase() async throws {
        // Given
        let returnedVal = 10
        let localPath = "http://127.0.0.1:3000/"
        let weatherSerivce = WeatherServiceImpl(baseUrl: localPath)
        
        // When
        let temperature = try await weatherSerivce.getTemperature()
        print(temperature)
        
        // Then
        XCTAssertNotNil(temperature)
        XCTAssertEqual(temperature, Int(returnedVal))
    }
}
