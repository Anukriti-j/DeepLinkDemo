import SwiftUI

struct RootView: View {
    
    @StateObject private var router: AppRouter
    @ObservedObject var session: SessionManager
    
    init(session: SessionManager) {
        self.session = session
        _router = StateObject(wrappedValue: AppRouter(session: session))
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            MainTabView()
                .navigationDestination(for: AppRoute.self) { route in
                    destination(for: route)
                }
        }
        .id(router.rootID)
        .environmentObject(router)
        .onAppear {
            guard router.didHandleDeepLinking == false else { return }
            router.navigate(to: session.isLoggedIn ? .home : .login)
        }
        .onOpenURL { url in
            print(url)
            if let route = DeepLinkHandler.parse(url: url) {
                router.didHandleDeepLinking = true
                router.navigate(to: route)
            }
        }
    }
    
    @ViewBuilder
    private func destination(for route: AppRoute) -> some View {
        switch route {
        case .home, .productList:
            MainTabView()
            
        case .productDetail(let id):
            ProductDetailView(productId: id)
            
        case .profile:
            ProfileView(session: session)
            
        case .login:
            LoginView(session: session)
            
        default:
            EmptyView()
        }
    }
    
}

#Preview {
    RootView(session: SessionManager())
}
