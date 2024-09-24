//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            Button {
                appRouter.append(MainRouterPath.screen1)
            } label: {
                Text("Go to Screen 1")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
