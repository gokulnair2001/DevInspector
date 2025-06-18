//
//  UIView+Frame.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 17/06/25.
//

import UIKit

/**
 * UIView extension providing utility properties for view inspection
 * 
 * This extension adds convenience properties that are useful for
 * debugging and inspecting views in the hierarchy.
 */
extension UIView {
    
    /**
     * Returns the class name of the view as a string
     * 
     * This property is useful for identifying the type of view
     * when inspecting the view hierarchy. It provides a human-readable
     * representation of the view's class.
     * 
     * Example: A UILabel would return "UILabel"
     */
    var className: String {
        return String(describing: type(of: self))
    }
}
