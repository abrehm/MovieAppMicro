@testable import HomeMic

import Nimble
import Quick

class HomeViewModelSpec: AsyncSpec {
    override class func spec() {
        describe("HomeViewModel") {
            var uut: HomeViewModel?
            var mockHomeRouter: MockHomeRouter?
            
            beforeEach {
                uut = HomeViewModel()
                mockHomeRouter = MockHomeRouter()
                uut?.homeRouter = mockHomeRouter!
            }
            
            describe("when .seeStyleGuideButtonTapped()") {
                beforeEach {
                    uut?.seeStyleGuideButtonTapped()
                }
                
                it("calls .homeRouter.navigate(to:)") {
                    expect(mockHomeRouter?.navigateWasCalled).to(beTrue())
                }
                
                describe("that call") {
                    it("has a destinationValue of .styleGuide") {
                        expect(mockHomeRouter?.destinationValue).to(equal(MockHomeRouter.Destination.styleGuide))
                    }
                }
            }
        }
    }
}
