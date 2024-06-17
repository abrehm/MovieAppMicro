import SwiftUI

public class HomeRouter: ObservableObject {
    public static let shared: HomeRouter = .init()

    public enum Destination: Codable, Hashable {
        case styleGuide
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
