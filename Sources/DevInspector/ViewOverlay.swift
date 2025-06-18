//
//  ViewOverlay.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 17/06/25.
//

import UIKit

/**
 * ViewOverlay - Represents a visual overlay that highlights a target view
 * 
 * This class creates a transparent overlay with a red border that matches
 * the frame of a target view, making it easy to identify views in the hierarchy.
 * 
 * The overlay is positioned to exactly match the target view's frame in the
 * coordinate system of the inspector window.
 */
class ViewOverlay: UIView {
    
    /// The view that this overlay is highlighting
    private let targetView: UIView
    
    /// The class name of the target view for identification purposes
    private(set) var originalName: String
    
    /**
     * Initializes a new overlay for the specified target view
     * 
     * This method:
     * 1. Stores a reference to the target view
     * 2. Records the target view's class name
     * 3. Converts the target view's frame to the inspector window's coordinate system
     * 4. Sets up the visual appearance (red border, transparent background)
     * 
     * - Parameter target: The view that should be highlighted by this overlay
     */
    init(target: UIView) {
        self.targetView = target
        self.originalName = target.className
        
        // Convert the target view's frame to the coordinate system of the inspector window
        // This ensures the overlay appears in the correct position
        let convertedFrame = target.superview?.convert(target.frame, to: nil) ?? target.frame
        super.init(frame: convertedFrame)

        // Set up the visual appearance of the overlay
        self.layer.borderColor = UIColor.red.cgColor  // Red border to highlight the view
        self.layer.borderWidth = 1                    // 1-point border width
        self.backgroundColor = UIColor.clear          // Transparent background
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
