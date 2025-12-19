import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    @State private var viewProfile = false
    
    var body: some View {
        VStack {
            Text("Suggested Products")
            List {
                ForEach(viewModel.suggestedProducts) { product in
                    ProductListCardView(product: product)
                }
            }
            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView()
}
