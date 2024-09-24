//
//  AppRouter.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//

import Foundation
import SwiftUI
 
final class AppRouter: ObservableObject {
    
    // MARK: - Variables
    @Published var navigationPath = NavigationPath()

    // MARK: - Functions
    func append(_ newElement: any AppRoute) {
        navigationPath.append(newElement)
    }
    
    /// Remove the last 'screens' routes from the navigation path.
    func removeLast(_ screens: Int = 1) {
        if navigationPath.count >= screens {
            navigationPath.removeLast(screens)
        }
    }
    
    /// Encode the navigation path to a Data object.
    private func encodedNavigationPath() -> Data? {
        try? navigationPath.codable.map(JSONEncoder().encode)
    }
    
    /// Pop back to a specific route in the navigation path.
    ///
    /// - Parameter route: The route up to which it should be popped; should be of type `AppRoute`.
    func popToSpecificRoute(_ route: any AppRoute, completion: ((Bool) -> Void)? = nil) {
        if let navigationStack = getNavigationStack() {
            if let index = navigationStack.firstIndex(where: { $0 == route }) {
                /// Check if only one element is there in stack
                if navigationStack.count == 1 {
                    self.removeLast()
                } else {
                    self.removeLast(index)
                }
                completion?(true)
            } else {
                print("Route not found")
                completion?(false)
            }
        } else {
            print("NavigationStack found nil...")
            completion?(false)
        }
    }
    
    /// Pop back to root.
    func popToRoot() {
        if let navigationStack = getNavigationStack() {
            self.removeLast((navigationStack.count))
        }
    }
    
    /// Retrieves top view from navigation stack.
    func getTopView() -> DecodedAppRoute? {
        return getNavigationStack()?.first
    }
    
    /// Retrieves the decoded navigation stack.
    /// - Returns: An array of `DecodedAppRoute` representing the navigation stack.
    private func getNavigationStack() -> [DecodedAppRoute]? {
        guard let encodedPath = encodedNavigationPath() else {
            print("NavigationCoordinator: Encoded path not found")
            return nil
        }
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: encodedPath) as? [String] ?? []
            var decodedStack: [DecodedAppRoute] = []
            
            for json in jsonArray {
                guard json.contains("{"),
                      let jsonData = json.data(using: .utf8),
                      let jsonDictionary = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
                else {
                    continue
                }
                
                let encodedData = try JSONSerialization.data(withJSONObject: jsonDictionary)
                let decodedRoute = try JSONDecoder().decode(DecodedAppRoute.self, from: encodedData)
                decodedStack.append(decodedRoute)
            }
            
            return decodedStack
        } catch {
            print("NavigationCoordinator: Error - \(error)")
            return nil
        }
    }
}
 
struct DecodedAppRoute: AppRoute, Codable {
    let name: String
}
