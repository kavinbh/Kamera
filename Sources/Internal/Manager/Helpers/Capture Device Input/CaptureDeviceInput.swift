
import AVKit

protocol CaptureDeviceInput: NSObject {
    // MARK: Attributes
    associatedtype CD: CaptureDevice
    var device: CD { get }

    // MARK: Methods
    static func get(mediaType: AVMediaType, position: AVCaptureDevice.Position?) -> Self?
}
