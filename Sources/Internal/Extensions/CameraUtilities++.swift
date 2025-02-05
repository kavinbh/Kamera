import AVKit

extension CameraFlashMode {
    func toDeviceFlashMode() -> AVCaptureDevice.FlashMode { switch self {
        case .off: .off
        case .on: .on
        case .auto: .auto
    }}
}
