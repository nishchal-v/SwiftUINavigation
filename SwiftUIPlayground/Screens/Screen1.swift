//
//  Screen1.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//

import SwiftUI

struct Screen1: View {
    
    @State var selectedTab = 3
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
//        TabView(selection: $selectedTab) {
//            Screen3()
//                .tag(3)
//                .tabItem {
//                    Text("Screen 3")
//                }
//            Screen4()
//                .tag(4)
//                .tabItem {
//                    Text("Screen 4")
//                }
//        }
        TabBarWrapper(selectedTabIndex: $selectedTab)
            .navigationTitle("Screen 1")
    }
}

#Preview {
    Screen1()
}
