import SwiftUI

extension MCamera { @MainActor class Config {
    // MARK: Screens
    var cameraScreen: CameraScreenBuilder = DefaultCameraScreen.init
    var capturedMediaScreen: CapturedMediaScreenBuilder? = DefaultCapturedMediaScreen.init
    var errorScreen: ErrorScreenBuilder = DefaultCameraErrorScreen.init

    // MARK: Actions
    var imageCapturedAction: (UIImage, MCamera.Controller) -> () = { _,_ in }
    var videoCapturedAction: (URL, MCamera.Controller) -> () = { _,_ in }
    var closeMCameraAction: () -> () = {}

    // MARK: Others
    var appDelegate: MApplicationDelegate.Type? = nil
    var isCameraConfigured: Bool = false
}}
