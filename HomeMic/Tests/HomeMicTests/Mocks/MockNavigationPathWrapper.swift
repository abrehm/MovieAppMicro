@testable import Navigation
import SwiftUI

public class MockNavigationPathWrapper: NavigationPathWrapper {
    var appendToNavPathWasCalled = false
    var valuePassed: Any?
    var navigateBackWasCalled = false
    var navigateToRootWasCalled = false
    
    override public func appendToNavPath<V>(_ value: V) where V: Decodable, V: Encodable, V: Hashable {
        appendToNavPathWasCalled = true
        valuePassed = value
        
        super.appendToNavPath(value)
    }
    
//    override public func navigateBack() {
//        navigateBackWasCalled = true
//        
//        super.navigateBack()
//    }
//    
//    override public func navigateToRoot() {
//        navigateToRootWasCalled = true
//        
//        super.navigateToRoot()
//    }
}
