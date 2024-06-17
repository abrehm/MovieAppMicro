import CommonUI
import DataModels
import SwiftUI

public struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    
    public init(movie: Movie) {
        self.viewModel = MovieDetailsViewModel(movie: movie)
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(maxWidth: .infinity)
                
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.red)
                    .onTapGesture {
                        viewModel.favoriteIconTapped()
                    }
            }
            .padding()
            
            Text(viewModel.movie.title)
                .titleTextStyle()
            
            AsyncImageViewBuilder(urlString: viewModel.movie.posterUrl) { phase in
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
            
            HStack {
                Text("Year : ")
                    .subTitleTextStyle()
                
                Text("\(viewModel.movie.year)")
                    .bodyTextStyle()
            }
            
            HStack {
                Text("Type : ")
                    .subTitleTextStyle()
                
                Text("\(viewModel.movie.type)")
                    .bodyTextStyle()
            }
            
            HStack {
                Text("ID : ")
                    .subTitleTextStyle()
                
                Text("\(viewModel.movie.imdbId)")
                    .bodyTextStyle()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.fetchFavorite()
        }
    }
}

// MARK: - Previews

#Preview("Image") {
    MovieDetailsView(movie: Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg"))
}

#Preview("No Image") {
    MovieDetailsView(movie: Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "bad_url"))
}

#Preview {
    let movie = Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg")
    
    var viewModel = MovieDetailsViewModel(movie: movie)
    viewModel.favoriteIconTapped()
    
    var view = MovieDetailsView(movie: movie)
    view.viewModel = viewModel
    
    return view
}
