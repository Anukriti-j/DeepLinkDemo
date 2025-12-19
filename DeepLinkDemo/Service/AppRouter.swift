import Foundation
import Combine
import SwiftUI

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var tabSelection: MainTabView.Tab = .home
    @Published var rootID = UUID()
    @Published var didHandleDeepLinking = false
    let session: SessionManager
    
    init(session: SessionManager) {
        self.session = session
    }
    
    func navigate(to route: AppRoute) {
        switch route {
        case .home:
            path = NavigationPath()
            tabSelection = .home
            
        case .productList:
            path = NavigationPath()
            tabSelection = .products
            
        case .productDetail(let id):
            path.append(AppRoute.productDetail(id: id))
            
        case .profile:
            if session.isLoggedIn {
                path.append(AppRoute.profile)
            } else {
                path.append(AppRoute.login)
            }
            
        case .login:
            path.append(AppRoute.login)
        }
    }
    
    func handlePostLoginRedirect() {
        path.removeLast()
        path.append(AppRoute.profile)
    }
    
    func logout() {
        session.isLoggedIn = false
        resetToRoot()
        path.append(AppRoute.login)
    }
    
    func resetToRoot() {
        path = NavigationPath()
        rootID = UUID()
        tabSelection = .home
    }
}
