//
//  UILabel+Padding.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 17/06/25.
//

import UIKit

/**
 * UILabel extension providing padding functionality
 * 
 * This extension adds a convenience method to UILabel for applying
 * padding around text content, making it easier to create labels
 * with consistent spacing.
 */
extension UILabel {
    
    /**
     * Applies padding around the text content of the label
     * 
     * This method modifies the text drawing area to include the specified
     * padding insets, creating space around the text content.
     * 
     * - Parameters:
     *   - top: Padding to apply to the top of the text
     *   - left: Padding to apply to the left of the text
     *   - bottom: Padding to apply to the bottom of the text
     *   - right: Padding to apply to the right of the text
     */
    func padding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        drawText(in: self.bounds.inset(by: insets))
    }
} 