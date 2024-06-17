import SwiftUI

public class NavigationPathWrapper: ObservableObject {
    @Published public var navPath = NavigationPath()
    
    func appendToNavPath<V>(_ value: V) where V: Decodable, V: Encodable, V: Hashable {
        navPath.append(value)
    }
    
    func navigateBack() {
        guard navPath.count > 0 else { return }
        
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        guard navPath.count > 0 else { return }
        
        navPath.removeLast(navPath.count)
    }
}
