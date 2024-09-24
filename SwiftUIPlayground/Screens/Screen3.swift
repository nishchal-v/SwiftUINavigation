//
//  Screen3.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//

import SwiftUI

struct Screen3: View {
    
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        ZStack {
            Button {
                appRouter.append(InnerRouterPath.screen2)
            } label: {
                Text("Go to Screen 2")
            }
        }
        .navigationTitle("Screen 3")
        .navigationDestination(for: InnerRouterPath.self) { route in
            switch route {
            case .screen2:
                Screen2()
            default:
                fatalError()
            }
        }
    }
}

#Preview {
    Screen3()
}
