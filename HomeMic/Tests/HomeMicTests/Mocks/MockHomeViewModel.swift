@testable import HomeMic

class MockHomeViewModel: HomeViewModel {
    var seeStyleGuideButtonTappedWasCalled = false
    
    override func seeStyleGuideButtonTapped() {
        seeStyleGuideButtonTappedWasCalled = true
    }
}
