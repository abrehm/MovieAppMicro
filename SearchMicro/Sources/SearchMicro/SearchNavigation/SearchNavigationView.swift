import Navigation
import SwiftUI

public struct SearchNavigationView: View {
    var viewModel = SearchNavigationViewModel()
    @ObservedObject var navPathWrapper = SearchRouter.shared.navPathWrapper
    
    public init() {}
    
    var didAppear: ((Self) -> Void)?
    
    public var body: some View {
        NavigationStack(path: $navPathWrapper.navPath) {
            viewModel.createSearchView()
                .navigationDestination(for: SearchRouter.Destination.self) { destination in
                    switch destination {
                    case .movieDetails(let movie):
                        viewModel.createMovieDetailsView(movie: movie)
                    }
                }
                .onAppear {
                    self.didAppear?(self)
                }
                .padding(5)
                .id("searchMainNavStack")
        }
    }
}

// MARK: - Previews

#if DEBUG

import DataModels
import FeatureView

class MockSearchNavigationVieModel: SearchNavigationViewModel {
    var searchViewState: ScreenStateType = .error
    let movie = Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg")
    
    override func createSearchView() -> SearchView {
        let viewModel = SearchViewModel()
        viewModel.state = searchViewState
        viewModel.searchMovieResults = [movie, movie, movie, movie]
        return SearchView(viewModel: viewModel)
    }
    
    override func createMovieDetailsView(movie _: Movie) -> MovieDetailsView {
        return MovieDetailsView(movie: movie)
    }
}

#Preview("State .error") {
    var viewModel = MockSearchNavigationVieModel()
    var view = SearchNavigationView()
    view.viewModel = viewModel
    
    return view
}

#Preview("State .showEmpty") {
    var viewModel = MockSearchNavigationVieModel()
    viewModel.searchViewState = .showEmpty
    var view = SearchNavigationView()
    view.viewModel = viewModel
    
    return view
}

#Preview("State .showData") {
    var viewModel = MockSearchNavigationVieModel()
    viewModel.searchViewState = .showData
    var view = SearchNavigationView()
    view.viewModel = viewModel
    
    return view
}

#Preview("State .loading") {
    var viewModel = MockSearchNavigationVieModel()
    viewModel.searchViewState = .loading
    var view = SearchNavigationView()
    view.viewModel = viewModel
    
    return view
}

#endif
