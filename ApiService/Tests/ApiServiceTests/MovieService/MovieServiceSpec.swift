@testable import ApiService

import Nimble
import Quick

class MovieServiceSpec: AsyncSpec {
    override class func spec() {
        describe("MovieService") {
            var uut: MovieService?
            beforeEach {
                uut = MovieService()
            }

            describe("when .getMovies()") {
                describe("is called with a valid search term") {
                    var response: [Movie]?

                    beforeEach {
                        response = try await uut?.getMovies(bySearchTerm: "batman")
                    }

                    it("returns a response with Movies") {
                        expect(response).toNot(beNil())
                    }
                }
            }
        }
    }
}
