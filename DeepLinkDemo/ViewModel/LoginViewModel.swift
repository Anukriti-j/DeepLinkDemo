import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var isLoading = false
    let session: SessionManager
    
    init(session: SessionManager) {
        self.session = session
    }
    
    func login() {
        isLoading = true
        defer { isLoading = false }
        
        session.login()
    }
}
