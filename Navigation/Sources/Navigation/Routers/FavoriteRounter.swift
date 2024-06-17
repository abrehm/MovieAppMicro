//
//  SwiftUIView.swift
//  
//
//  Created by Hai Nguyen on 2/15/24.
//

import SwiftUI
import DataModels

public class FavoriteRouter: ObservableObject {
    public static let shared: FavoriteRouter = .init()
    
    public enum Destination: Codable, Hashable {
        case movieDetails(movie: Movie)
    }
    
    @Published public var navPathWrapper = NavigationPathWrapper()
    
    public func navigate(to destination: Destination) {
        navPathWrapper.appendToNavPath(destination)
    }
    
    public func navigateBack() {
        navPathWrapper.navigateBack()
    }
    
    public func navigateToRoot() {
        navPathWrapper.navigateToRoot()
    }
}
