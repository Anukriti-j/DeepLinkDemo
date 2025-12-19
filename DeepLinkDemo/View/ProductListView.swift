//
//  ProductListView.swift
//  DeepLinkDemo
//
//  Created by coditas on 19/12/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.products) { product in
                    NavigationLink {
                        ProductDetailView(productId: product.id.uuidString)
                    } label: {
                        ProductListCardView(product: product)
                    }
                }
            }
        }
        .navigationTitle("Products")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductListView()
}
