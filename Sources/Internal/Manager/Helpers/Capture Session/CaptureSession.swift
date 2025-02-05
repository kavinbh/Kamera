
import AVKit

protocol CaptureSession: Sendable {
    // MARK: Attributes
    var isRunning: Bool { get }
    var deviceInputs: [any CaptureDeviceInput] { get }
    var outputs: [AVCaptureOutput] { get }
    var sessionPreset: AVCaptureSession.Preset { get set }

    // MARK: Methods
    func startRunning()
    func stopRunningAndReturnNewInstance() -> CaptureSession
    func add(input: (any CaptureDeviceInput)?) throws(MCameraError)
    func remove(input: (any CaptureDeviceInput)?)
    func add(output: AVCaptureOutput?) throws(MCameraError)
}
