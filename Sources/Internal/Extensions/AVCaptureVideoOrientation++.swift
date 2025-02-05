import SwiftUI
import AVKit

extension AVCaptureVideoOrientation {
    func getAngle() -> Angle { switch self {
        case .portrait: .degrees(0)
        case .landscapeLeft: .degrees(-90)
        case .landscapeRight: .degrees(90)
        case .portraitUpsideDown: .degrees(180)
        default: .degrees(0)
    }}
}

extension AVCaptureVideoOrientation {
    func toImageOrientation() -> UIImage.Orientation { switch self {
        case .portrait: .downMirrored
        case .landscapeLeft: .leftMirrored
        case .landscapeRight: .rightMirrored
        case .portraitUpsideDown: .upMirrored
        default: .up
    }}
}

extension AVCaptureVideoOrientation {
    func toDeviceOrientation() -> UIDeviceOrientation { switch self {
        case .portrait: .portrait
        case .portraitUpsideDown: .portraitUpsideDown
        case .landscapeLeft: .landscapeLeft
        case .landscapeRight: .landscapeRight
        default: .portrait
    }}
}
