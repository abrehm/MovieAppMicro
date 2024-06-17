@testable import ApiService
@testable import Navigation
@testable import DataModels

import Nimble
import Quick
import SwiftUI

class SearchRouterSpec: QuickSpec {
    override class func spec() {
        var uut: SearchRouter?
        var mockNavigationPathWrapper: MockNavigationPathWrapper?
        
        describe("SearchRouter") {
            var movie: Movie?
            
            beforeEach {
                uut = SearchRouter()
                mockNavigationPathWrapper = MockNavigationPathWrapper()
                uut?.navPathWrapper = mockNavigationPathWrapper!
                movie = Movie(title: "someTitle", year: "", imdbId: "", type: "", posterUrl: "")
            }
            
            describe("navigate(to:)") {
                beforeEach {
                    uut?.navigate(to: .movieDetails(movie: movie!))
                }
                
                it("calls .navPathWrapper.appendToNavPath()") {
                    expect(mockNavigationPathWrapper?.appendToNavPathWasCalled).to(beTrue())
                }
                
                describe("that call") {
                    it("has a valuePassed of '.movieDetails' with the expected Movie data model") {
                        let passed: SearchRouter.Destination = mockNavigationPathWrapper?.valuePassed as! SearchRouter.Destination
                        expect(passed).to(equal(SearchRouter.Destination.movieDetails(movie: movie!)))
                    }
                }
            }
            
            describe("navigateBack()") {
                beforeEach {
                    mockNavigationPathWrapper?.navPath.append(SearchRouter.Destination.movieDetails(movie: movie!))
                    uut?.navigateBack()
                }
                
                it("calls .navPathWrapper.navigateBack()") {
                    expect(mockNavigationPathWrapper?.navigateBackWasCalled).to(beTrue())
                }
            }
            
            describe("navigateToRoot()") {
                beforeEach {
                    mockNavigationPathWrapper?.navPath.append(SearchRouter.Destination.movieDetails(movie: movie!))
                    uut?.navigateToRoot()
                }
                
                it("calls .navPathWrapper.navigateBack()") {
                    expect(mockNavigationPathWrapper?.navigateToRootWasCalled).to(beTrue())
                }
            }
        }
    }
}
