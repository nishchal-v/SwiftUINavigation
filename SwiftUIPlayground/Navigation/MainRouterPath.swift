//
//  MainRouterPath.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//


struct MainRouterPath: AppRoute {
    let name: String
    
    static let screen1 = MainRouterPath(name: "screen1")
}

struct InnerRouterPath: AppRoute {
    let name: String
    
    static let screen2 = InnerRouterPath(name: "screen2")
}
