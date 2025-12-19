import SwiftUI

struct ProductDetailView: View {
    @StateObject private var viewModel = ProductDetailViewModel()
    let productId: String
    
    var body: some View {
        Group {
            if let product = viewModel.product {
                VStack {
                    Image(systemName: "gift")
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Text(product.productName)
                        .font(.largeTitle)
                    
                    Text("\(product.productPrice)")
                        .font(.subheadline)
                }
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Text("Product could not found")
            }
        }
        .navigationTitle("Product Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadProduct(id: productId)
        }
        
    }
}

#Preview {
    ProductDetailView(productId: UUID().uuidString)
}
