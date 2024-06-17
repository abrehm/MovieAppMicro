import FavoritesMicro
import HomeMic
import SearchMicro
import SwiftUI

public struct BottomTabView: View {
    public init() {}

    var didAppear: ((Self) -> Void)?

    public var body: some View {
        TabView {
            HomeNavigationView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchNavigationView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoriteNavigationView()
                .tabItem {
                    Label("Favs", systemImage: "heart")
                }
        }
        .onAppear { self.didAppear?(self) }
    }
}

#Preview {
    BottomTabView()
}
