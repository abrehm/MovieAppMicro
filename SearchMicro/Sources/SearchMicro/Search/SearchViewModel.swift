import Foundation
import Navigation
import ApiService
import Combine
import Foundation
import DataModels

//MARK: - Screen State Enum --> This could move to utilities micro app
enum ScreenStateType {
    case error
    case showData
    case showEmpty
    case loading
}

//MARK: - ViewModel
public class SearchViewModel: ObservableObject {
    @Published var state: ScreenStateType = .showEmpty
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    @Published var searchMovieResults: [Movie] = []
    private let searchRouter = SearchRouter.shared
    private let movieService = MovieService.shared
    private var debouncedText = ""
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.debouncedText = value
                
                if (!self.debouncedText.isEmpty) {
                    DispatchQueue.main.async {
                        Task {
                            do {
                                let moviesResponse = try await self.movieService.getMovies(bySearchTerm: self.debouncedText) ?? []
                                if moviesResponse.isEmpty {
                                    self.state = .showEmpty
                                } else {
                                    self.searchMovieResults = moviesResponse
                                    self.state = .showData
                                }
                            } catch {
                                // TODO: Change state to show error, but now api is not sending error when emptry
                                self.state = .showEmpty
                            }
                        }
                    }
                }
            }.store(in: &subscriptions)
    }
    
    func goToMovieDetails(movie: Movie) {
        searchRouter.navigate(to: .movieDetails(movie: movie))
    }
}
