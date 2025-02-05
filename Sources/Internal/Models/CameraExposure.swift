import AVKit

struct CameraExposure {
    var duration: CMTime = .zero
    var targetBias: Float = 0
    var iso: Float = 0
    var mode: AVCaptureDevice.ExposureMode = .autoExpose
}
