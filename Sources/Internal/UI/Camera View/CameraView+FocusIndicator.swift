import SwiftUI

@MainActor class CameraFocusIndicatorView {
    var image: UIImage = .init(resource: .iconCrosshair)
    var tintColor: UIColor = .init(resource: .backgroundYellow)
    var size: CGFloat = 96
}

// MARK: Create
extension CameraFocusIndicatorView {
    func create(at touchPoint: CGPoint) -> UIImageView {
        let focusIndicator = UIImageView(image: image)
        focusIndicator.contentMode = .scaleAspectFit
        focusIndicator.tintColor = tintColor
        focusIndicator.frame.size = .init(width: size, height: size)
        focusIndicator.frame.origin.x = touchPoint.x - size / 2
        focusIndicator.frame.origin.y = touchPoint.y - size / 2
        focusIndicator.transform = .init(scaleX: 0, y: 0)
        focusIndicator.tag = .focusIndicatorTag
        return focusIndicator
    }
}
