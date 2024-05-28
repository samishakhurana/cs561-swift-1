import XCTest
import MyLibrary

final class WeatherModelTest: XCTestCase {
    
    private func getWeatherJSON() throws -> String {
        let file = try XCTUnwrap(Bundle.module.path(forResource: "sampleData", ofType: "json"))
        let json = try String(contentsOfFile: file)
        
        return json
    }
    
    func testWeatherServiceModel_canConvertObjectToJSON() throws {
        // Given
        let json = try getWeatherJSON()
        let jsonData = Data(json.utf8)
        let jsonDecoder = JSONDecoder()
        
        // When
        let weather = try jsonDecoder.decode(Weather.self, from: jsonData)
        
        
        // Then
        XCTAssertNotNil(weather)
    }
}

