//
//  InspectorWindow.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 17/06/25.
//

import UIKit

/**
 * InspectorWindow - Custom window for displaying the inspector overlay
 * 
 * This class creates a specialized window that appears above all other
 * windows and displays the inspector interface. It ensures that the
 * inspector is always visible and doesn't interfere with the underlying app.
 */
class InspectorWindow: UIWindow {
    
    /**
     * Initializes the inspector window with the specified root view controller
     * 
     * This method sets up a window that:
     * - Covers the entire screen
     * - Appears above other windows (alert + 1 level)
     * - Has a transparent background
     * - Contains the inspector view controller
     * 
     * - Parameter rootViewController: The view controller to display in the inspector window
     */
    init(rootViewController: UIViewController) {
        super.init(frame: UIScreen.main.bounds)
        self.windowLevel = .alert + 1  // Ensure it appears above other windows
        self.backgroundColor = .clear  // Transparent background
        self.isHidden = false          // Make it visible
        self.rootViewController = InspectorViewController(rootVC: rootViewController)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
