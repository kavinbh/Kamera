
import SwiftUI

// MARK: Camera Output Type
public enum CameraOutputType: CaseIterable {
    case photo
    case video
}

// MARK: Camera Position
public enum CameraPosition: CaseIterable {
    case back
    case front
}

// MARK: Camera Flash Mode
public enum CameraFlashMode: CaseIterable {
    case off
    case on
    case auto
}

// MARK: Camera Light Mode
public enum CameraLightMode: CaseIterable {
    case off
    case on
}

// MARK: Camera HDR Mode
public enum CameraHDRMode: CaseIterable {
    case off
    case on
    case auto
}
