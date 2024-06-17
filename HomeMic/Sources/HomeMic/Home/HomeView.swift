import CommonUI
import FeatureComponent
import Navigation
import SwiftUI

public struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    public init() {}

    var didAppear: ((Self) -> Void)?

    public var body: some View {
        VStack {
            HStack {
                Image(systemName: "house")
                    .imageScale(.large)
                    .foregroundStyle(Color.primaryDark)
                    .fontWeight(.bold)
                
                Text("HOME VIEW!!!")
                    .largeTitleTextStyle()
            }
            
            HStack {
                Button("See style guide") {
                    viewModel.seeStyleGuideButtonTapped()
                }
                .buttonStyle(GreenButton(isEnabled: true))
            }
            
            if !viewModel.mockTopMovies.isEmpty {
                VStack {
                    HStack {
                        Text("Top 10 Movies")
                            .subTitleTextStyle()
                            .padding()
                            .border(Color.secondaryDark)
                        
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.mockTopMovies, id: \.self) { movie in
                                MovieCard(movie: movie)
                            }
                        }
                    }
                }
                .padding()
            }
            
            if !viewModel.mockRecentMovies.isEmpty {
                VStack {
                    HStack {
                        Text("New Releases")
                            .subTitleTextStyle()
                            .padding()
                            .border(Color.secondaryDark)
                        
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.mockRecentMovies, id: \.self) { movie in
                                MovieCard(movie: movie)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear { self.didAppear?(self) }
        .padding()
    }
}

#Preview {
    HomeView()
}
