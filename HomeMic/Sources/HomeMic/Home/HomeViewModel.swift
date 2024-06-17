import ApiService
import DataModels
import Foundation
import Navigation

public class HomeViewModel: ObservableObject {
    @Published var mockTopMovies: [Movie] = []
    @Published var mockRecentMovies: [Movie] = []
    
    var homeRouter = HomeRouter.shared
    var movieService = MovieService.shared
    
    init() {
        Task {
            do {
                let batmanResponse = try await movieService.getMovies(bySearchTerm: "batman") ?? []
                let supermanResponse = try await movieService.getMovies(bySearchTerm: "superman") ?? []
                mockRecentMovies = batmanResponse
                mockTopMovies = supermanResponse
            } catch {
                // TODO: Handel error here..;
                print("Error : An error occur when fetching data.")
            }
        }
    }
    
    func seeStyleGuideButtonTapped() {
        homeRouter.navigate(to: .styleGuide)
    }
}
