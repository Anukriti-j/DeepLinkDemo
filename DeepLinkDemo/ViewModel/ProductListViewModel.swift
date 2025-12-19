import Foundation
import Combine

final class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(id: UUID(), productName: "Chiwda", productPrice: 100.0),
        Product(id: UUID(), productName: "Chips", productPrice: 50.0),
        Product(id: UUID(), productName: "Wafers", productPrice: 150.0),
        Product(id: UUID(), productName: "Chocolate Cake", productPrice: 550.0),
        Product(id: UUID(), productName: "Muffins", productPrice: 350.0),
        Product(id: UUID(), productName: "Cake", productPrice: 550.0),
        Product(id: UUID(), productName: "Sweets", productPrice: 350.0)
    ]
}

