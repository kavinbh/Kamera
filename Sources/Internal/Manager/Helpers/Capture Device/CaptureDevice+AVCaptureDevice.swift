import AVKit
extension AVCaptureDevice: CaptureDevice {
    var minExposureDuration: CMTime { activeFormat.minExposureDuration }
    var maxExposureDuration: CMTime { activeFormat.maxExposureDuration }
    var minISO: Float { activeFormat.minISO }
    var maxISO: Float { activeFormat.maxISO }
    var minFrameRate: Float64? { activeFormat.videoSupportedFrameRateRanges.first?.minFrameRate }
    var maxFrameRate: Float64? { activeFormat.videoSupportedFrameRateRanges.first?.maxFrameRate }
}
extension AVCaptureDevice {
    var lightMode: CameraLightMode {
        get { torchMode == .off ? .off : .on }
        set { torchMode = newValue == .off ? .off : .on }
    }
    var hdrMode: CameraHDRMode {
        get {
            if automaticallyAdjustsVideoHDREnabled { return .auto }
            else if isVideoHDREnabled { return .on }
            else { return .off }
        }
        set {
            automaticallyAdjustsVideoHDREnabled = newValue == .auto
            if newValue != .auto { isVideoHDREnabled = newValue == .on }
        }
    }
}
