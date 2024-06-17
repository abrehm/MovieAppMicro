import XCTest
@testable import ApiService

final class ApiServiceTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testGetMovies() async {
        let movieService = MovieService()
        
        do {
            let movies = try await movieService.getMovies(bySearchTerm: "batman")
            XCTAssertNotNil(movies, "Movies should not be nil")
            // Add more assertions based on your specific requirements
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
    }
}
