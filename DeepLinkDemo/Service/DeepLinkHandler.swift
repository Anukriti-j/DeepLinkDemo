import Foundation

struct DeepLinkHandler {
    
    static func parse(url: URL) -> AppRoute? {
        
        let components = url.pathComponents.filter { $0 != "/" }
        
        switch url.host {
        case "home":
            return .home
            
        case "products":
            return .productList
            
        case "product":
            if let productId = components.first {
                return .productDetail(id: productId)
            }
            
        case "profile":
            return .profile
            
        default:
            return nil
        }
        
        return nil
    }
}
