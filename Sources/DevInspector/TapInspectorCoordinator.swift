//
//  TapInspectorCoordinator.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 18/06/25.
//

import UIKit
import SwiftUI

/**
 * TapInspectorCoordinator - Handles tap gestures and view inspection
 * 
 * This class is responsible for:
 * - Setting up double-tap gesture recognition on the root view
 * - Detecting which view was tapped
 * - Presenting detailed information about the tapped view
 * - Managing temporary highlight overlays
 */
final class TapInspectorCoordinator {
    
    /// Weak reference to the root view where gestures are detected
    private(set) weak var rootView: UIView?
    
    /// Temporary overlay view that highlights the currently selected view
    private var overlay: UIView?
    
    /// Information label displayed with the overlay
    private var infoLabel: UILabel?

    /**
     * Initializes the coordinator with the specified root view
     * 
     * - Parameter rootView: The view on which tap gestures should be detected
     */
    init(rootView: UIView) {
        self.rootView = rootView
        setupGesture()
    }

    /**
     * Sets up the double-tap gesture recognizer on the root view
     * 
     * This method adds a double-tap gesture that will trigger
     * the view inspection functionality when activated.
     */
    private func setupGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        rootView?.addGestureRecognizer(doubleTap)
    }

    /**
     * Presents the inspector panel with detailed information about the selected view
     * 
     * This method creates a SwiftUI view with comprehensive information about
     * the tapped view and presents it as a modal sheet.
     * 
     * - Parameter view: The view that was tapped and should be inspected
     */
    private func presentInspector(for view: UIView) {
        guard let rootVC = rootView?.window?.rootViewController else { return }

        // Create the detailed inspector view with view information
        let detailsView = ViewInspectorDetailsView(
            className: (view as? ViewOverlay)?.originalName ?? view.className,
            frame: view.frame,
            backgroundColor: view.backgroundColor,
            tag: view.tag,
            alpha: view.alpha,
            isHidden: view.isHidden,
            accessibilityIdentifier: view.accessibilityIdentifier
        )

        // Present the inspector as a modal sheet
        let hosting = UIHostingController(rootView: detailsView)
        hosting.modalPresentationStyle = .pageSheet
        rootVC.present(hosting, animated: true, completion: nil)
    }

    /**
     * Handles double-tap gestures on the root view
     * 
     * This method:
     * 1. Determines which view was tapped using hit testing
     * 2. Ensures the tapped view is not the root view itself
     * 3. Presents the inspector for the tapped view
     * 
     * - Parameter gesture: The double-tap gesture recognizer
     */
    @objc private func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
        guard let view = rootView,
                 let target = view.hitTest(gesture.location(in: view), with: nil),
                 target != view else {
               return
           }

           presentInspector(for: target)
    }

    /**
     * Clears any existing overlay and information label
     * 
     * This method removes temporary visual elements that were
     * created to highlight selected views.
     */
    func clearOverlay() {
        overlay?.removeFromSuperview()
        infoLabel?.removeFromSuperview()
        overlay = nil
        infoLabel = nil
    }
}
