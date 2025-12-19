//
//  DeepLinkDemoApp.swift
//  DeepLinkDemo
//
//  Created by coditas on 19/12/25.
//

import SwiftUI

@main
struct DeepLinkDemoApp: App {
    @StateObject private var sessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            RootView(session: sessionManager)
        }
    }
}
