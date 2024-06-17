import DataModels
import FeatureView

class SearchNavigationViewModel {
    // MARK: - View Builders

    func createSearchView() -> SearchView {
        SearchView()
    }

    func createMovieDetailsView(movie: Movie) -> MovieDetailsView {
        MovieDetailsView(movie: movie)
    }
}
