import Foundation
import Combine

final class SessionManager: ObservableObject {
    @Published var isLoggedIn = false
    
    func login() {
        isLoggedIn = true
        print("\(isLoggedIn)")
    }
}
