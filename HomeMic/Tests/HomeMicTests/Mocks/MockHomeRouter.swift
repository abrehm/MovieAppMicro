@testable import Navigation

public class MockHomeRouter: HomeRouter {
    var navigateWasCalled = false
    var destinationValue: HomeRouter.Destination?
    var navigateToRootWasCalled = false

    override public func navigate(to destination: HomeRouter.Destination) {
        navigateWasCalled = true
        destinationValue = destination
    }

    override public func navigateToRoot() {
        navigateToRootWasCalled = true
    }
}
