@testable import HomeMic
@testable import Navigation

import Nimble
import Quick
import SwiftUI
import ViewInspector

class HomeNavigationViewSpec: QuickSpec {
    override class func spec() {
        describe("HomeNavigationView") {
            var uut: HomeNavigationView?
            var mockViewModel: MockHomeNavigationViewModel?
            var mockNavigationPathWrapper: MockNavigationPathWrapper?

            describe("the Observables") {
                beforeEach {
                    uut = HomeNavigationView()
                }

                it("has a navPathWrapper") {
                    expect(uut?.navPathWrapper).to(be(HomeRouter.shared.navPathWrapper))
                }
            }

            describe("the body") {
                beforeEach {
                    mockViewModel = MockHomeNavigationViewModel()
                    mockNavigationPathWrapper = MockNavigationPathWrapper()
                    var screen = HomeNavigationView()
                    screen.viewModel = mockViewModel!
                    screen.navPathWrapper = mockNavigationPathWrapper!

                    let _ = screen.on(\.didAppear) { view in
                        uut = try? view.actualView()
                    }

                    ViewHosting.host(view: screen)
                }

                // MARK: - NavigationStack

                describe("the NavigationStack") {
                    describe("the Children") {
                        describe("HomeView") {
                            var homeView: InspectableView<ViewType.ClassifiedView>?

                            beforeEach {
                                homeView = try uut?.inspect().find(viewWithId: "homeView")
                            }

                            it("is not nil") {
                                expect(homeView).toNot(beNil())
                            }
                        }
                    }
                }

                // MARK: - Navigation Destination Changes

                describe("when the .navigationDestination changes to .styleGuide") {
                    beforeEach {
                        let _ = uut!.on(\.didAppear) { _ in
                            uut?.navPathWrapper.appendToNavPath(HomeRouter.Destination.styleGuide)
                        }

                        ViewHosting.host(view: uut!)
                    }

                    it("calls .viewModel.createStyleGuideView()") {
                        expect(mockViewModel?.createStyleGuideViewWasCalled).to(beTrue())
                    }
                }
            }
        }
    }
}
