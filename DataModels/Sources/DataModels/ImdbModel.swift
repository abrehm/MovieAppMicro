//
//  File.swift
//  
//
//  Created by Hai Nguyen on 2/12/24.
//

import Foundation

public enum NetworkError: Codable, Error {
    case badUrl
    case noData
    case decodingError
}

public struct MovieSearch: Codable {
    public var searchResult: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case searchResult = "Search"
    }
}

public struct Movie: Codable, Hashable {
    public var title: String
    public var year: String
    public var imdbId: String
    public var type: String
    public var posterUrl: String
    
    public init(title: String, year: String, imdbId: String, type: String, posterUrl: String) {
        self.title = title
        self.year = year
        self.imdbId = imdbId
        self.type = type
        self.posterUrl = posterUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case posterUrl = "Poster"
    }
}

struct MovieError: Codable, Error {
    public var error: String = "There was a problem getting the movies. Sorry, try again."
    public var networkError: NetworkError?
    
    public enum CodingKeys: String, CodingKey {
        case error = "Error"
    }
}
