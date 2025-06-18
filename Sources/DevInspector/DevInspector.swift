//
//  DevInspector.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 17/06/25.
//

import UIKit

/**
 * DevInspector - Main entry point for the view hierarchy inspector
 * 
 * This enum provides a simple API to show/hide the inspector overlay
 * that displays red borders around all views in the hierarchy.
 * 
 * Usage:
 * - DevInspector.show(on: viewController) - Activates the inspector
 * - DevInspector.hide() - Deactivates the inspector
 */
public enum DevInspector {
    
    /// The inspector window that overlays the entire screen
    private static var inspectorWindow: UIWindow?
    
    /**
     * Shows the inspector overlay on top of the specified view controller
     * 
     * This method creates a transparent window that covers the entire screen
     * and displays red borders around all views in the hierarchy.
     * 
     * - Parameter viewController: The view controller whose view hierarchy should be inspected
     */
    public static func show(on viewController: UIViewController) {
        
        DispatchQueue.main.async {
            
            // Find the active window scene to create the inspector window
            guard let windowScene = UIApplication.shared
                .connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
                return
            }
            
            // Create a new window for the inspector overlay
            let window = UIWindow(windowScene: windowScene)
            window.frame = UIScreen.main.bounds
            window.windowLevel = .alert + 1  // Ensure it appears above other windows
            window.backgroundColor = .clear
            
            // Create and set the inspector view controller
            let inspectorVC = InspectorViewController(rootVC: viewController)
            window.rootViewController = inspectorVC
            window.isHidden = false
            window.makeKeyAndVisible()
            
            // Store reference to the inspector window
            inspectorWindow = window
        }
    }
    
    /**
     * Hides the inspector overlay and cleans up resources
     * 
     * This method removes the inspector window and cleans up
     * all associated view controllers and overlays.
     */
    public static func hide() {
        
        DispatchQueue.main.async {
            inspectorWindow?.isHidden = true
            inspectorWindow?.rootViewController = nil
            inspectorWindow = nil
        }
        
    }
}
