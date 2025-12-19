import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var router: AppRouter
    
    enum Tab {
        case home
        case products
    }
    
    var body: some View {
        TabView(selection: $router.tabSelection) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                .tag(MainTabView.Tab.home)
            
            ProductListView()
                .tabItem { Label("Products", systemImage: "gift") }
                .tag(MainTabView.Tab.products)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    router.navigate(to: .profile)
                } label: {
                    Image(systemName: "person")
                }
            }
        }
    }
}

#Preview {
    MainTabView()
}
