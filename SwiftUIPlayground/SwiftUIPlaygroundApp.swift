//
//  SwiftUIPlaygroundApp.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//

import SwiftUI

@main
struct SwiftUIPlaygroundApp: App {
    
    @StateObject var appRouter = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appRouter.navigationPath) {
                ContentView()
                    .navigationDestination(for: MainRouterPath.self) { route in
                        switch route {
                        case .screen1:
                            Screen1()
                        default:
                            fatalError()
                        }
                    }
            }
            .environmentObject(appRouter)
        }
    }
}
