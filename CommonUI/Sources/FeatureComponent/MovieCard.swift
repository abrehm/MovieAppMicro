import CommonUI
import DataModels
import SwiftUI

public struct MovieCard: View {
    let movie: Movie
    public init(movie: Movie) {
        self.movie = movie
    }

    public var body: some View {
        VStack {
            AsyncImageViewBuilder(urlString:movie.posterUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                } else if phase.error != nil {
                    Image(systemName: "film")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(Color.secondaryLight)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                }
            }
            .padding(10)
        }
    }
}

#Preview("Has Image") {
    MovieCard(movie: Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg"))
}

#Preview("No Image") {
    MovieCard(movie: Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "bad_url"))
}
