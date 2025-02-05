import Foundation

@MainActor class CameraManagerNotificationCenter {
    private(set) var parent: CameraManager!
}

// MARK: Setup
extension CameraManagerNotificationCenter {
    func setup(parent: CameraManager) {
        self.parent = parent
        NotificationCenter.default.addObserver(self, selector: #selector(handleSessionWasInterrupted), name: .AVCaptureSessionWasInterrupted, object: parent.captureSession)
    }
}
private extension CameraManagerNotificationCenter {
    @objc func handleSessionWasInterrupted() {
        parent.attributes.lightMode = .off
        parent.videoOutput.reset()
    }
}

// MARK: Reset
extension CameraManagerNotificationCenter {
    func reset() {
        NotificationCenter.default.removeObserver(self, name: .AVCaptureSessionWasInterrupted, object: parent?.captureSession)
    }
}
