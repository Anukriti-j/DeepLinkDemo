import Foundation
import Combine

final class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product?
    @Published var isLoading = false
    
    func loadProduct(id: String) {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.product = Product(
                id: UUID(),
                productName: "Demo Product \(id)",
                productPrice: 999
            )
            self.isLoading = false
        }
    }
}
