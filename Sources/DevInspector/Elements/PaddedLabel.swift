//
//  PaddedLabel.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 18/06/25.
//

import UIKit

/**
 * PaddedLabel - A UILabel subclass that provides customizable text padding
 * 
 * This class extends UILabel to add padding around the text content,
 * making it useful for creating labels with consistent spacing and
 * better visual appearance in overlays and UI elements.
 */
final class PaddedLabel: UILabel {
    
    /// The insets to apply around the text content
    var textInsets = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)

    /**
     * Overrides the text drawing to apply padding insets
     * 
     * This method ensures that the text is drawn with the specified
     * padding insets, creating space around the text content.
     * 
     * - Parameter rect: The rectangle in which to draw the text
     */
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }

    /**
     * Overrides the intrinsic content size to account for padding
     * 
     * This ensures that the label's size includes the padding insets
     * when auto-layout calculates the intrinsic content size.
     * 
     * - Returns: The intrinsic content size including padding
     */
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + textInsets.left + textInsets.right,
                      height: size.height + textInsets.top + textInsets.bottom)
    }
}

