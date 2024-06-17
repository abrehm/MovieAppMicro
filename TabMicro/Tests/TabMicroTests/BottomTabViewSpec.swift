@testable import FavoritesMicro
@testable import HomeMic
@testable import SearchMicro
@testable import TabMicro

import Nimble
import Quick
import SwiftUI
import ViewInspector

class BottomTabViewSpec: QuickSpec {
    override class func spec() {
        var uut: BottomTabView?

        describe("the body") {
            beforeEach {
                var screen = BottomTabView()
                let _ = screen.on(\.didAppear) { view in
                    uut = try? view.actualView()
                }

                ViewHosting.host(view: screen)
            }

            describe("the TabView") {
                // MARK: - HomeNavigationView

                describe("the FIRST tab item (HomeNavigationView)") {
                    var tabItem: InspectableView<ViewType.ClassifiedView>?

                    describe("the .tabItem") {
                        beforeEach {
                            tabItem = try uut?.inspect().tabView().view(HomeNavigationView.self, 0).tabItem()
                        }

                        it("has a title of 'Home'") {
                            let text = try tabItem?.find(ViewType.Text.self).string()
                            expect(text).to(equal("Home"))
                        }

                        it("has .systemImage of 'house'") {
                            let icon = try tabItem?.find(ViewType.Image.self).actualImage().name()
                            expect(icon).to(equal("house"))
                        }
                    }
                }

                // MARK: - SearchNavigationView

                describe("the SECOND tab item (SearchNavigationView)") {
                    var tabItem: InspectableView<ViewType.ClassifiedView>?

                    describe("the .tabItem") {
                        beforeEach {
                            tabItem = try uut?.inspect().tabView().view(SearchNavigationView.self, 1).tabItem()
                        }

                        it("has a title of 'Search'") {
                            let text = try tabItem?.find(ViewType.Text.self).string()
                            expect(text).to(equal("Search"))
                        }

                        it("has .systemImage of 'magnifyingglass'") {
                            let icon = try tabItem?.find(ViewType.Image.self).actualImage().name()
                            expect(icon).to(equal("magnifyingglass"))
                        }
                    }
                }

                // MARK: - FavoritesView

                describe("the THIRD tab item (FavoritesView)") {
                    var tabItem: InspectableView<ViewType.ClassifiedView>?

                    describe("the .tabItem") {
                        beforeEach {
                            tabItem = try uut?.inspect().tabView().view(FavoriteNavigationView.self, 2).tabItem()
                        }

                        it("has a title of 'Favs'") {
                            let text = try tabItem?.find(ViewType.Text.self).string()
                            expect(text).to(equal("Favs"))
                        }

                        it("has .systemImage of 'heart'") {
                            let icon = try tabItem?.find(ViewType.Image.self).actualImage().name()
                            expect(icon).to(equal("heart"))
                        }
                    }
                }
            }
        }
    }
}
