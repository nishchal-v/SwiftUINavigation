//
//  AppRoute.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//

import Foundation
 
protocol AppRoute: Hashable, Codable {
    var name: String { get }
}
 
extension AppRoute {
    
    static func == (lhs: Self, rhs: any AppRoute) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}
