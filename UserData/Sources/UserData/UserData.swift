import SwiftUI
import DataModels

public class UserData: ObservableObject {
    public static let shared: UserData = .init()
    
    @Published public var favoriteMovies: [Movie] = [] 
    private let serialQueue = DispatchQueue(label: "favoriteQueue", attributes: .concurrent)
    
    private init() { }
    
    //MARK: - public functions
    public func updateFavirateStatus(on movie: Movie) -> Bool {
        if (isFavorite(movie: movie)) {
            removeFavorite(movie: movie)
        } else {
            addFavorite(movie: movie)
        }
        
        return isFavorite(movie: movie)
    }
    
    public func isFavorite(movie: Movie) -> Bool {
        serialQueue.sync {
            self.favoriteMovies.contains(where: { $0.imdbId == movie.imdbId})
        }
    }
    
    //MARK: - private functions
    private func addFavorite(movie: Movie) {
        serialQueue.async(flags: .barrier) {
            self.favoriteMovies.append(movie)
        }
    }
    
    private func removeFavorite(movie: Movie) {
        serialQueue.async(flags: .barrier) {
            self.favoriteMovies.removeAll(where: { $0.imdbId == movie.imdbId })
        }
    }
}
