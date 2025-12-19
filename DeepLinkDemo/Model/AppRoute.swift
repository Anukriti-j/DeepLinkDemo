import Foundation

enum AppRoute: Hashable {
    case home
    case productList
    case productDetail(id: String)
    case profile
    case login
}
