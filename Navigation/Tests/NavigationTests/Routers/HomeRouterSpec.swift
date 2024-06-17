@testable import Navigation
import Nimble
import Quick
import SwiftUI

class HomeRouterSpec: QuickSpec {
    override class func spec() {
        var uut: HomeRouter?
        var mockNavigationPathWrapper: MockNavigationPathWrapper?
        
        beforeEach {
            uut = HomeRouter()
        }
        describe("HomeRouter") {
            beforeEach {
                mockNavigationPathWrapper = MockNavigationPathWrapper()
                uut?.navPathWrapper = mockNavigationPathWrapper!
            }
            
            describe("navigate(to:)") {
                beforeEach {
                    uut?.navigate(to: .styleGuide)
                }
                
                it("calls .navPathWrapper.appendToNavPath()") {
                    expect(mockNavigationPathWrapper?.appendToNavPathWasCalled).to(beTrue())
                }
                
                describe("that call") {
                    it("has a valuePassed of '.styleGuide'") {
                        let passed: HomeRouter.Destination = mockNavigationPathWrapper?.valuePassed as! HomeRouter.Destination
                        expect(passed).to(equal(HomeRouter.Destination.styleGuide))
                    }
                }
            }
            
            describe("navigateBack()") {
                beforeEach {
                    mockNavigationPathWrapper?.navPath.append(HomeRouter.Destination.styleGuide)
                    uut?.navigateBack()
                }
                
                it("calls .navPathWrapper.navigateBack()") {
                    expect(mockNavigationPathWrapper?.navigateBackWasCalled).to(beTrue())
                }
            }
            
            describe("navigateToRoot()") {
                beforeEach {
                    mockNavigationPathWrapper?.navPath.append(HomeRouter.Destination.styleGuide)
                    uut?.navigateToRoot()
                }
                
                it("calls .navPathWrapper.navigateBack()") {
                    expect(mockNavigationPathWrapper?.navigateToRootWasCalled).to(beTrue())
                }
            }
        }
    }
}
