@testable import HomeMic

class MockHomeNavigationViewModel: HomeNavigationViewModel {
    var createStaticIconViewWasCalled = false
    var createStyleGuideViewWasCalled = false
    
    override func createStyleGuideView() -> StyleGuideView {
        createStyleGuideViewWasCalled = true
        
        return StyleGuideView()
    }
}
