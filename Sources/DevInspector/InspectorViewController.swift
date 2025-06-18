//
//  InspectorViewController.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 17/06/25.
//

import UIKit

/**
 * InspectorViewController - Manages the inspector overlay interface
 * 
 * This view controller is responsible for:
 * - Creating and managing overlay views for all subviews in the hierarchy
 * - Setting up the tap inspector for interactive view selection
 * - Providing a transparent overlay that doesn't interfere with user interaction
 */
class InspectorViewController: UIViewController {
    
    /// The root view controller whose hierarchy is being inspected
    private let rootVC: UIViewController
    
    /// Coordinator for handling tap gestures and view selection
    private var tapInspector: TapInspectorCoordinator?
    
    /// Array of overlay views that highlight each view in the hierarchy
    private var overlayViews: [UIView] = []
    
    /**
     * Initializes the inspector view controller
     * 
     * - Parameter rootVC: The view controller whose view hierarchy should be inspected
     */
    init(rootVC: UIViewController) {
        self.rootVC = rootVC
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen  // Present as overlay without dismissing underlying VC
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear  // Transparent background
        
        setupOverlays()
    }
    
    /**
     * Sets up the overlay system by creating overlays for all subviews
     * 
     * This method:
     * 1. Walks through the entire view hierarchy
     * 2. Creates a ViewOverlay for each view found
     * 3. Adds all overlays to this view controller's view
     * 4. Sets up the tap inspector for interactive functionality
     */
    private func setupOverlays() {
        // Create overlays for all subviews in the hierarchy
        overlayViews = HierarchyWalker.overlayAllSubviews(from: rootVC.view)
        
        // Add all overlays to this view controller's view
        overlayViews.forEach { view.addSubview($0) }
        
        // Set up tap inspector for interactive view selection
        tapInspector = TapInspectorCoordinator(rootView: view)
    }
}

