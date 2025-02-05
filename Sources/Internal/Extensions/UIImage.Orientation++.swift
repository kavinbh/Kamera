import SwiftUI

extension UIImage.Orientation {
    init(_ orientation: CGImagePropertyOrientation) { switch orientation {
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        case .up: self = .up
        case .upMirrored: self = .upMirrored
    }}
}
