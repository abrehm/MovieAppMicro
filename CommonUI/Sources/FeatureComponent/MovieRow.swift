import CommonUI
import DataModels
import SwiftUI

public struct MovieRow: View {
    let movie: Movie
    public init(movie: Movie) {
        self.movie = movie
    }
    
    public var body: some View {
        HStack {
            AsyncImageViewBuilder(urlString:movie.posterUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                } else if phase.error != nil {
                    Image(systemName: "film")
                        .resizable()
                        .foregroundStyle(Color.secondaryLight)
                        .cornerRadius(4)
                } else {
                    ProgressView()
                }
            }
            .cornerRadius(4)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 80)
            .padding(10)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .subTitleTextStyle()
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                
                Text("Year : \(movie.year)")
                    .smallBodyTextStyle()
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                Text("Type : \(movie.type)")
                    .smallBodyTextStyle()
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondaryLight.opacity(0.4), lineWidth: 1)
                .background(Color.white)
        )
    }
}

#Preview {
    VStack {
        MovieRow(movie: Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg"))
        
        MovieRow(movie: Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "bad_url"))
    }
}
