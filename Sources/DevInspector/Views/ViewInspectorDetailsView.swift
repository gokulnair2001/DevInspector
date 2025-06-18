//
//  ViewInspectorDetailsView.swift
//  DevInspector
//
//  Created by Gokul Nair(Work) on 18/06/25.
//

import SwiftUI

/**
 * ViewInspectorDetailsView - SwiftUI view for displaying detailed view information
 * 
 * This view presents comprehensive information about a selected view in a
 * structured, easy-to-read format. It displays properties like class name,
 * frame, background color, and other relevant view attributes.
 */
struct ViewInspectorDetailsView: View {
    
    /// The class name of the view being inspected
    let className: String
    
    /// The frame (position and size) of the view
    let frame: CGRect
    
    /// The background color of the view (if any)
    let backgroundColor: UIColor?
    
    /// The tag value assigned to the view
    let tag: Int
    
    /// The alpha (transparency) value of the view
    let alpha: CGFloat
    
    /// Whether the view is currently hidden
    let isHidden: Bool
    
    /// The accessibility identifier of the view (if any)
    let accessibilityIdentifier: String?

    var body: some View {
        NavigationView {
            List {
                // General information section
                Section(header: Text("General")) {
                    InfoRow(label: "Class", value: className)
                    InfoRow(label: "Frame", value: "\(frame.width) x \(frame.height)")
                    InfoRow(label: "Tag", value: "\(tag)")
                }

                // Appearance properties section
                Section(header: Text("Appearance")) {
                    InfoRow(label: "Alpha", value: "\(alpha)")
                    InfoRow(label: "Hidden", value: "\(isHidden.description)")
                    InfoRow(label: "Background", value: backgroundColor?.description ?? "nil")
                }

                // Accessibility section (only shown if identifier exists)
                if let id = accessibilityIdentifier {
                    Section(header: Text("Accessibility")) {
                        InfoRow(label: "Identifier", value: id)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("🔍 View Inspector")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

/**
 * InfoRow - Helper view for displaying label-value pairs
 * 
 * This view creates a consistent layout for displaying
 * property names and their corresponding values.
 */
private struct InfoRow: View {
    
    /// The label (property name) to display
    let label: String
    
    /// The value to display
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
    }
}
