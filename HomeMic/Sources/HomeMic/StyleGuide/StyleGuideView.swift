import CommonUI
import DataModels
import FeatureComponent
import FeatureView
import SwiftUI

public struct StyleGuideView: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    public init() {}
    
    public var body: some View {
        ScrollView {
            Text("Style Guide")
                .largeTitleTextStyle()
            UnderlineView()
            
            ColorGuideView()
            UnderlineView()
            
            ButtonGuideView()
            UnderlineView()
            
            TextGuideView()
            UnderlineView()
            
            SearchBarGuideView(searchText: $searchText, isSearching: $isSearching)
            UnderlineView()
            
            MovieRowView()
            UnderlineView()
            
            MovieCardView()
            UnderlineView()
            
            MovieDetailsDemoView()
            UnderlineView()
        }
    }
}

// Underline
struct UnderlineView: View {
    var body: some View {
        Text("------------------------------------------------")
            .foregroundColor(.primaryDark)
            .fontWeight(.bold)
    }
}

// Color Guide
struct ColorGuideView: View {
    var body: some View {
        VStack {
            Text("Color Guide")
                .subTitleTextStyle()
                .padding()
                .border(Color.secondaryDark)
            
            ZStack {
                Color.primaryDark
                Text("Color.primaryDark")
                    .foregroundColor(.white)
            }
            ZStack {
                Color.secondaryDark
                Text("Color.secondaryDark")
                    .foregroundColor(.white)
            }
            ZStack {
                Color.primaryLight
                Text("Color.primaryLight")
            }
            ZStack {
                Color.secondaryLight
                Text("Color.secondaryLight")
            }
        }
        .padding(.bottom)
    }
}

// Button Guide
struct ButtonGuideView: View {
    var body: some View {
        VStack {
            Text("Button Guide")
                .subTitleTextStyle()
                .padding()
                .border(Color.secondaryDark)
            
            Button("Green Button isEnable is true") {
                print("Clicked : Green Button isEnable is true")
            }
            .buttonStyle(GreenButton(isEnabled: true))
            
            Button("Green Button isEnable is false") {
                print("Clicked : Green Button isEnable is false")
            }
            .buttonStyle(GreenButton(isEnabled: false))
            
            Button("Light Green Button") {
                print("Clicked : Light Green Button e")
            }
            .buttonStyle(LightGreenButton())
        }
        .padding(.bottom)
    }
}

// Text Guide
struct TextGuideView: View {
    var body: some View {
        VStack {
            Text("Text Guide")
                .subTitleTextStyle()
                .padding()
                .border(Color.secondaryDark)
            
            Text(".largeTitleTextStyle()")
                .largeTitleTextStyle()
            Text(".titleTextStyle()")
                .titleTextStyle()
            Text(".smallTitleTextStyle()")
                .smallTitleTextStyle()
            Text(".subTitleTextStyle()")
                .subTitleTextStyle()
            Text(".bodyTextStyle()")
                .bodyTextStyle()
            Text(".smallBodyTextStyle()")
                .smallBodyTextStyle()
        }
        .padding(.bottom)
    }
}

// SearchBar Guide
struct SearchBarGuideView: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        VStack {
            Text("Search Bar Guide")
                .subTitleTextStyle()
                .padding()
                .border(Color.secondaryDark)
            
            SearchBar(searchText: $searchText, isSearching: $isSearching)
                .padding()
            if isSearching {
                Text("✅ Searching is true | with search term : \(searchText)")
            } else {
                Text("❌ Searching is false | with search term : \(searchText)")
            }
        }
        .padding(.bottom)
    }
}

// Movie Row
struct MovieRowView: View {
    let mockMovie = Movie(
        title: "Movie Title",
        year: "0000",
        imdbId: "12345",
        type: "movie",
        posterUrl: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
    )
    
    var body: some View {
        VStack {
            Text("Movie Row Guide")
                .subTitleTextStyle()
                .padding()
                .border(Color.secondaryDark)
            
            MovieRow(movie: mockMovie)
        }
        .padding(.bottom)
    }
}

// Movie Card
struct MovieCardView: View {
    let mockMovie = Movie(
        title: "Movie Title",
        year: "0000",
        imdbId: "12345",
        type: "movie",
        posterUrl: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
    )
    
    var body: some View {
        VStack {
            Text("Movie Card Guide")
                .subTitleTextStyle()
                .padding()
                .border(Color.secondaryDark)
            
            ScrollView(.horizontal) {
                HStack {
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                    MovieCard(movie: mockMovie)
                }
            }
        }
        .padding(.bottom)
    }
}

// Movie Details Common
struct MovieDetailsDemoView: View {
    let mockMovie = Movie(
        title: "Movie Title",
        year: "0000",
        imdbId: "12345",
        type: "movie",
        posterUrl: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
    )
    
    var body: some View {
        VStack {
            Text("Movie Details Common Guide")
                .subTitleTextStyle()
                .padding()
                .border(Color.secondaryDark)
            
            MovieDetailsView(movie: mockMovie)
        }
        .padding(.bottom)
    }
}

// MARK: - Preview

#Preview {
    StyleGuideView()
}
