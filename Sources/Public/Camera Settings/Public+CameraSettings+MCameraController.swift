
import Foundation

// MARK: Available Actions
public extension MCamera.Controller {
    /**
     Closes the MCamera.

     See ``MCamera/setCloseMCameraAction(_:)`` for more details.
     */
    func closeMCamera() { mCamera.config.closeMCameraAction() }

    /**
     Opens the Camera Screen.
     */
    func reopenCameraScreen() { mCamera.manager.setCapturedMedia(nil) }
}
