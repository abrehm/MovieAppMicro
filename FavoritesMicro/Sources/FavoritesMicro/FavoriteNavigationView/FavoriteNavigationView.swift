import Navigation
import SwiftUI

public struct FavoriteNavigationView: View {
    var viewModel = FavoriteNavigationViewModel()
    @ObservedObject var navPathWrapper = FavoriteRouter.shared.navPathWrapper

    public init() {}

    var didAppear: ((Self) -> Void)?

    public var body: some View {
        NavigationStack(path: $navPathWrapper.navPath) {
            FavoritesView()
                .navigationDestination(for: FavoriteRouter.Destination.self) { destination in
                    switch destination {
                    case .movieDetails(let movie):
                        viewModel.createMovieDetailsView(movie: movie)
                    }
                }
                .onAppear {
                    self.didAppear?(self)
                }
                .padding(5)
                .id("favoriteMainNavStack")
        }
    }
}

// MARK: - Previews

#Preview("No Favs") {
    FavoriteNavigationView()
}

#if DEBUG
import DataModels
import UserData

#Preview("Has Favs") {
    let movie = Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg")

    UserData.shared.favoriteMovies = [movie, movie, movie]

    return FavoriteNavigationView()
}
#endif
