import SwiftUI

struct ProductListCardView: View {
    var product: Product
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gift")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(product.productName)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    
                    Text("\(product.productPrice)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .background(
            Rectangle()
                .foregroundStyle(.clear)
                .frame(height: 300)
                .shadow(color: .black.opacity(0.2), radius: 4)
        )
    }
}

#Preview {
    ProductListCardView(product: Product(id: UUID(), productName: "Cookies", productPrice: 25.0))
}
