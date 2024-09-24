//
//  BATabBar.swift
//  SwiftUIPlayground
//
//  Created by Nishchal Visavadiya on 24/09/24.
//


import SwiftUI
import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    @Binding var selectedTabIndex: Int
    
    init(selectedTabIndex: Binding<Int>) {
        _selectedTabIndex = selectedTabIndex
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
        setupTabs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabs() {
        let screen3 = UIHostingController(rootView: Screen3())
        screen3.tabBarItem = UITabBarItem(title: "Screen 3", image: UIImage(systemName: "list.bullet"), tag: 0)
        
        let screen4 = UIHostingController(rootView: Screen4())
        screen4.tabBarItem = UITabBarItem(title: "Screen 4", image: UIImage(systemName: "calendar"), tag: 1)
        self.viewControllers = [screen3, screen4]
    }
    
    // Sync selection with the SwiftUI state
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            selectedTabIndex = 0
        case 1:
            selectedTabIndex = 1
        default:
            break
        }
    }
}

struct TabBarWrapper: UIViewControllerRepresentable {
    @Binding var selectedTabIndex: Int

    func makeUIViewController(context: Context) -> CustomTabBarController {
        let tabBarController = CustomTabBarController(selectedTabIndex: $selectedTabIndex)
        return tabBarController
    }

    func updateUIViewController(_ uiViewController: CustomTabBarController, context: Context) {
        uiViewController.selectedTabIndex = selectedTabIndex
    }
}
