import DataModels
import FeatureView

class FavoriteNavigationViewModel {
    // MARK: - View Builders
    
    func createMovieDetailsView(movie: Movie) -> MovieDetailsView {
        return MovieDetailsView(movie: movie)
    }
}
