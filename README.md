# DevInspector

A powerful iOS development tool that provides real-time view hierarchy inspection with visual overlays and detailed view information.

## 🎯 Overview

DevInspector is a lightweight, easy-to-integrate iOS library that helps developers visualize and inspect their app's view hierarchy during development. It overlays red borders around all views and provides detailed information about each view through an interactive interface.

## ✨ Features

- **Visual View Hierarchy**: Red border overlays around all views in your app
- **Interactive Inspection**: Double-tap any view to see detailed information
- **Real-time Updates**: Overlays update automatically as views change
- **Comprehensive View Details**:
  - Class name and type
  - Frame dimensions and position
  - Background color
  - Alpha value
  - Hidden state
  - Tag value
  - Accessibility identifier
- **Non-intrusive**: Transparent overlay that doesn't interfere with app functionality
- **Easy Integration**: Simple API with just two method calls

## 📱 Screenshots

_[Screenshots would be added here showing the inspector in action]_

## 🚀 Installation

### Swift Package Manager

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/yourusername/DevInspector.git`
3. Select the version you want to use
4. Click **Add Package**

### Manual Installation

1. Download the source files
2. Add all files from the `Sources/DevInspector` folder to your Xcode project
3. Make sure to include all the files in your target

## 📖 Usage

### Basic Usage

```swift
import DevInspector

// Show the inspector
DevInspector.show(on: self)

// Hide the inspector
DevInspector.hide()
```

### Complete Example

```swift
import UIKit
import DevInspector

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        // Your normal UI setup code here
        let label = UILabel()
        label.text = "Hello, World!"
        label.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
        view.addSubview(label)

        // Add a button to toggle the inspector
        let toggleButton = UIButton(type: .system)
        toggleButton.setTitle("Toggle Inspector", for: .normal)
        toggleButton.frame = CGRect(x: 50, y: 150, width: 200, height: 44)
        toggleButton.addTarget(self, action: #selector(toggleInspector), for: .touchUpInside)
        view.addSubview(toggleButton)
    }

    @objc private func toggleInspector() {
        // Simple toggle implementation
        // You can implement your own state tracking or use a boolean property
        static var isInspectorVisible = false

        if isInspectorVisible {
            DevInspector.hide()
            isInspectorVisible = false
        } else {
            DevInspector.show(on: self)
            isInspectorVisible = true
        }
    }
}
```

### Advanced Usage

```swift
// Show inspector with custom configuration
DevInspector.show(on: self)

// You can also show it from any view controller
if let rootVC = UIApplication.shared.windows.first?.rootViewController {
    DevInspector.show(on: rootVC)
}

// Hide when done
DevInspector.hide()
```

## 🎮 How It Works

### Visual Overlays

- **ViewOverlay**: Creates red border overlays around each view
- **HierarchyWalker**: Recursively traverses the view hierarchy
- **InspectorViewController**: Manages the overlay system

### Interactive Features

- **TapInspectorCoordinator**: Handles double-tap gestures
- **ViewInspectorDetailsView**: SwiftUI interface for view details
- **Real-time Updates**: Overlays automatically adjust to view changes

### Architecture

```
DevInspector (Main API)
├── InspectorWindow (Overlay Window)
├── InspectorViewController (Overlay Management)
├── HierarchyWalker (View Traversal)
├── ViewOverlay (Individual Overlays)
├── TapInspectorCoordinator (Gesture Handling)
└── ViewInspectorDetailsView (Details Interface)
```

## 📋 Requirements

- **iOS**: 13.0+
- **Swift**: 5.0+
- **Xcode**: 12.0+

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/gokulnair2001/DevInspector/blob/main/LICENSE) file for details.

## 🐛 Known Issues

- Currently only supports iOS (no macOS support)
- Overlays may not update immediately for programmatically created views
- Some complex view hierarchies might have performance impact

**Made with ❤️ for iOS developers**
