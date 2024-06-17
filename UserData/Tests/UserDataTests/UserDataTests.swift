import Nimble
import Quick
import SwiftUI
import ViewInspector
@testable import UserData
@testable import ApiService

class UserDataConcurrencySpec: QuickSpec {

    override class func spec() {

        describe("UserData concurrent add/remove movies") {

            var userData: UserData!

            beforeEach {
                userData = UserData.shared
            }

            it("should handle concurrent add/remove operations") {
                let dispatchGroup = DispatchGroup()
                let numberOfThreads = 10
                
                for _ in 0..<numberOfThreads {
                    dispatchGroup.enter()

                    DispatchQueue.global().async {
                        for _ in 0..<100 {
                            let movie = Movie(title: "Test Movie", year: "2024", imdbId: UUID().uuidString, type: "", posterUrl: "")
                            let isFavorite = userData.updateFavirateStatus(on: movie)
                            expect(isFavorite) == userData.isFavorite(movie: movie)
                        }

                        dispatchGroup.leave()
                    }
                }
                let timeout: DispatchTime = .now() + .seconds(10)
                let result = dispatchGroup.wait(timeout: timeout)

                expect(result).to(equal(.success))
            }
        }
    }
}
