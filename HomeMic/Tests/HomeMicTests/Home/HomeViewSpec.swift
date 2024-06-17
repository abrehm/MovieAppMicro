@testable import CommonUI
@testable import HomeMic

import Nimble
import Quick
import SwiftUI
import ViewInspector

class HomeViewSpec: QuickSpec {
    override class func spec() {
        var uut: HomeView?
        var mockHomeViewModel: MockHomeViewModel?

        describe("the variables") {
            beforeEach {
                uut = HomeView()
            }

            it("has a .viewModel of 'HomeViewModel'") {
                expect(uut?.viewModel).to(beAKindOf(HomeViewModel.self))
            }
        }

        describe("the body") {
            beforeEach {
                var screen = HomeView()
                mockHomeViewModel = MockHomeViewModel()
                screen.viewModel = mockHomeViewModel!

                let _ = screen.on(\.didAppear) { view in
                    uut = try? view.actualView()
                }

                ViewHosting.host(view: screen)
            }

            describe("the VStack") {
                describe("the HStack") {
                    // MARK: - Image

                    describe("the image, at index[0]") {
                        var actualImage: Image?

                        beforeEach {
                            actualImage = try uut?.inspect().vStack().hStack(0).image(0).actualImage()
                        }

                        it("has .systemName of 'house'") {
                            let imageName = try actualImage?.name()
                            expect(imageName).to(equal("house"))
                        }
                    }

                    // MARK: - Text

                    describe("the text, 'HOME VIEW!!!'") {
                        var text: InspectableView<ViewType.Text>?

                        beforeEach {
                            text = try uut?.inspect().find(text: "HOME VIEW!!!")
                        }

                        describe("the .largeTitleTextStyle()") {
                            it("has a .font(.largeTitle)") {
                                try expect(text?.attributes().font()).to(equal(.largeTitle))
                            }
                            //                        it("has a .fontWeight of .heavy") {
                            //                            try expect(text?.attributes().fontWeight()).to(equal(.heavy))
                            //                        }
                            //                        it("has a .foregroundStyle of Color.primaryDark") {
                            //                            try expect(text?.attributes().foregroundColor()).to(equal(Color.primaryDark))
                            //                        }
                        }
                    }
                }

                // MARK: - Styleguide Button

                describe("the Button, 'See style guide'") {
                    var button: InspectableView<ViewType.Button>?

                    beforeEach {
                        button = try uut?.inspect().find(button: "See style guide")
                    }

                    describe("when tapped") {
                        beforeEach {
                            try button?.tap()
                        }

                        it("calls .viewModel.seeStyleGuideButtonTapped()") {
                            expect(mockHomeViewModel?.seeStyleGuideButtonTappedWasCalled).to(beTrue())
                        }
                    }
                }
            }
        }
    }
}
