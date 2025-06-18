//
//  HierarchyWalker.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 17/06/25.
//

import UIKit

/**
 * HierarchyWalker - Utility for traversing the view hierarchy
 * 
 * This struct provides functionality to walk through all views in a view hierarchy
 * and create overlay views for each one. It uses a recursive approach to ensure
 * that all nested subviews are included.
 */
struct HierarchyWalker {
    
    /**
     * Creates overlay views for all subviews in the specified root view
     * 
     * This method recursively traverses the entire view hierarchy starting from
     * the root view and creates a ViewOverlay for each view encountered.
     * 
     * The traversal includes:
     * - The root view itself
     * - All direct subviews of the root view
     * - All nested subviews at any depth
     * 
     * - Parameter root: The root view from which to start the hierarchy traversal
     * - Returns: An array of ViewOverlay instances, one for each view in the hierarchy
     */
    static func overlayAllSubviews(from root: UIView) -> [UIView] {
        var overlays: [UIView] = []

        /**
         * Recursive helper function to walk through the view hierarchy
         * 
         * This function:
         * 1. Creates an overlay for the current view
         * 2. Adds it to the overlays array
         * 3. Recursively processes all subviews of the current view
         * 
         * - Parameter view: The current view being processed
         */
        func walk(_ view: UIView) {
            // Create an overlay for the current view
            let overlay = ViewOverlay(target: view)
            overlays.append(overlay)
            
            // Recursively process all subviews
            view.subviews.forEach { walk($0) }
        }

        // Start the recursive traversal from the root view
        walk(root)
        return overlays
    }
}
