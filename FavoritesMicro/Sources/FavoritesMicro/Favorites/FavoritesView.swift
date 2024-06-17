import CommonUI
import FeatureComponent
import SwiftUI

public struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()

    public init() {}

    public var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundStyle(Color.primaryDark)
                    .fontWeight(.bold)

                Text("Favorites")
                    .largeTitleTextStyle()
            }
            if viewModel.favoriteCount <= 0 {
                Text("Oops, looks like you have no favorites yet.")
            } else {
                List {
                    ForEach(viewModel.favorites, id: \.self) { movie in
                        MovieRow(movie: movie)
                            .listRowSeparatorTint(Color.white)
                            .listRowBackground(Color.white)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                            .id(movie.imdbId)
                            .onTapGesture {
                                viewModel.goToMovieDetails(movie: movie)
                            }
                    }
                }
                .listStyle(.plain)
                .accessibilityIdentifier("favoriteListView")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Previews

#Preview("No Favs") {
    FavoriteNavigationView()
}

#if DEBUG
import DataModels

#Preview("Has Favs") {
    let movie = Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg")

    var viewModel = FavoritesViewModel()
    viewModel.userData.favoriteMovies = [movie, movie, movie]
    var view = FavoritesView()
    view.viewModel = viewModel

    return view
}
#endif
